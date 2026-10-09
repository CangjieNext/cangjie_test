/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * Same-bucket reentrancy of ConcurrentHashMap user callbacks.
 *
 * The callbacks of entryView / replace / remove(key, predicate) run while the
 * bucket mutex is held. std.sync.Mutex is reentrant, so a callback may call
 * ConcurrentHashMap members for keys of the SAME bucket. The old
 * implementation rebuilt the bucket list from the PRE-callback snapshot and
 * stored it back, silently discarding every reentrant modification:
 *
 * - updates lost: a reentrant add from a read-only entryView was reverted;
 * - entries resurrected: a reentrant remove was undone by the stale snapshot;
 * - size divergence: the size counter disagreed with the actual entry count.
 *
 * The fix splits every bucket update into an intent phase (run the callbacks
 * on the snapshot) and an apply phase (re-load the bucket's current list and
 * apply the final intent to it).
 *
 * All keys below share one hash code, so they collide into a single bucket
 * and a single stripe mutex: reentrant calls take the same mutex instead of
 * blocking. Each case pre-grows its map (fillers added and removed) so that
 * no resize can trigger inside the reentrant callbacks: a callback-triggered
 * table switch is a separate pre-existing hazard out of this fix's scope.
 */

import std.collection.*
import std.collection.concurrent.*
import std.unittest.*

class ReentrantKey <: Hashable & Equatable<ReentrantKey> {
    let id: Int64
    public init(id: Int64) {
        this.id = id
    }
    public func hashCode(): Int64 {
        42
    }
    public operator func ==(that: ReentrantKey): Bool {
        this.id == that.id
    }
    public operator func !=(that: ReentrantKey): Bool {
        this.id != that.id
    }
}

func erIteratedCount<K, V>(m: ConcurrentHashMap<K, V>): Int64 where K <: Hashable & Equatable<K> {
    var cnt: Int64 = 0
    for ((_, _) in m) {
        cnt++
    }
    return cnt
}

func erFreshMap(): ConcurrentHashMap<ReentrantKey, Int64> {
    let m = ConcurrentHashMap<ReentrantKey, Int64>()
    for (i in 0..64) {
        let _ = m.add(ReentrantKey(100000 + i), i)
    }
    for (i in 0..64) {
        let _ = m.remove(ReentrantKey(100000 + i))
    }
    return m
}

@Test
class CHMEntryViewReentrantTest {

    // entryView assigns a value while the callback reentrantly removed the
    // same key: the remove happens first, then the assignment re-adds the
    // key. Size must stay consistent with the actual entries.
    @TestCase
    func entryViewUpdateWithReentrantRemoveKeepsSizeConsistent(): Unit {
        let m = erFreshMap()
        let _ = m.add(ReentrantKey(1), 1)
        let _ = m.entryView(ReentrantKey(1)) { ev =>
            let _ = m.remove(ReentrantKey(1))
            ev.value = Some(2)
        }
        @Expect(m.size, 1)
        @Expect(m.get(ReentrantKey(1)), Some(2))
        @Expect(m.contains(ReentrantKey(1)), true)
        @Expect(erIteratedCount(m), m.size)
    }

    // A read-only entryView must not revert a reentrant add performed by its
    // callback (the old snapshot store silently reverted it).
    @TestCase
    func readOnlyEntryViewKeepsReentrantAdd(): Unit {
        let m = erFreshMap()
        let _ = m.add(ReentrantKey(1), 1)
        let _ = m.add(ReentrantKey(2), 2)
        let _ = m.entryView(ReentrantKey(1)) { ev =>
            let _ = m.add(ReentrantKey(2), 99)
        }
        @Expect(m.get(ReentrantKey(2)), Some(99))
        @Expect(m.get(ReentrantKey(1)), Some(1))
        @Expect(m.size, 2)
        @Expect(erIteratedCount(m), m.size)
    }

    // entryView add + reentrant add of the same key: the entry is stored once
    // and counted once (the old code counted the add twice: size 2 vs 1).
    @TestCase
    func entryViewAddWithReentrantAddCountsOnce(): Unit {
        let m = erFreshMap()
        let _ = m.entryView(ReentrantKey(1)) { ev =>
            let _ = m.add(ReentrantKey(1), 100)
            ev.value = Some(5)
        }
        @Expect(m.size, 1)
        @Expect(m.get(ReentrantKey(1)), Some(5))
        @Expect(erIteratedCount(m), m.size)
    }

    // Deprecated replace(key, eval) with a reentrant remove inside eval: the
    // key stays removed (the old code resurrected it) and no old value is
    // reported.
    @TestCase
    func deprecatedReplaceEvalWithReentrantRemoveDoesNotResurrect(): Unit {
        let m = erFreshMap()
        let _ = m.add(ReentrantKey(1), 1)
        let r = m.replace(ReentrantKey(1), { old =>
            let _ = m.remove(ReentrantKey(1))
            old + 1
        })
        @Expect(r, None)
        @Expect(m.contains(ReentrantKey(1)), false)
        @Expect(m.size, 0)
        @Expect(erIteratedCount(m), m.size)
    }

    // Deprecated remove(key, predicate) with a reentrant add inside the
    // predicate: the reentrantly added entry must survive.
    @TestCase
    func deprecatedRemovePredicateKeepsReentrantAdd(): Unit {
        let m = erFreshMap()
        let _ = m.add(ReentrantKey(1), 1)
        let _ = m.add(ReentrantKey(2), 2)
        let r = m.remove(ReentrantKey(1), { v =>
            let _ = m.add(ReentrantKey(3), 3)
            true
        })
        @Expect(r, Some(1))
        @Expect(m.get(ReentrantKey(3)), Some(3))
        @Expect(m.get(ReentrantKey(2)), Some(2))
        @Expect(m.size, 2)
        @Expect(erIteratedCount(m), m.size)
    }

    // entryView with reentrant removes plus unconditional value assignment:
    // every key ends up present with the assigned value and size stays 10
    // (the old code dropped the size to 5 while keeping all 10 entries).
    @TestCase
    func entryViewMixedReentrancyKeepsSizeConsistent(): Unit {
        let m = erFreshMap()
        for (i in 0..10) {
            let _ = m.add(ReentrantKey(i), i)
        }
        for (i in 0..10) {
            let _ = m.entryView(ReentrantKey(i)) { ev =>
                if (i % 2 == 0) {
                    let _ = m.remove(ReentrantKey(i))
                }
                ev.value = Some(i * 10)
            }
        }
        @Expect(m.size, 10)
        var valuesOk = true
        for (i in 0..10) {
            if (m.get(ReentrantKey(i)) != Some(i * 10)) {
                valuesOk = false
            }
        }
        @Expect(valuesOk, true)
        @Expect(erIteratedCount(m), m.size)
    }

    // Multithreaded stress mixing reentrant entryView / add / remove on one
    // bucket: the size counter must always match the iterated entry count.
    @TestCase
    func concurrentReentrantStressKeepsSizeConsistent(): Unit {
        let m = erFreshMap()
        let threads = 8
        let perThread = 500
        let futures = ArrayList<Future<Unit>>()
        for (t in 0..threads) {
            futures.add(spawn {
                for (i in 0..perThread) {
                    let k = (i * threads + t) % 20
                    let _ = m.entryView(ReentrantKey(k)) { ev =>
                        let _ = m.add(ReentrantKey((k + 1) % 20), i)
                        ev.value = Some(i)
                    }
                    if (i % 3 == 0) {
                        let _ = m.remove(ReentrantKey((k + 5) % 20))
                    } else if (i % 3 == 1) {
                        let _ = m.remove(ReentrantKey((k + 5) % 20), {_ => true})
                    }
                }
            })
        }
        for (f in futures) {
            let _ = f.get()
        }
        @Expect(erIteratedCount(m), m.size)
        var valuesOk = true
        for (kv in m) {
            if (kv[1] < 0) {
                valuesOk = false
            }
        }
        @Expect(valuesOk, true)
    }

    // Plain (non-reentrant) API paths keep their original behaviour.
    @TestCase
    func plainApiPathsUnchanged(): Unit {
        let m = erFreshMap()
        @Expect(m.add(ReentrantKey(1), 1), None)
        @Expect(m.add(ReentrantKey(1), 10), Some(1))
        @Expect(m.get(ReentrantKey(1)), Some(10))
        @Expect(m.addIfAbsent(ReentrantKey(1), 20), Some(10))
        @Expect(m.addIfAbsent(ReentrantKey(2), 2), None)
        @Expect(m.replace(ReentrantKey(1), 11), Some(10))
        @Expect(m.get(ReentrantKey(1)), Some(11))
        @Expect(m.replace(ReentrantKey(3), 30), None)
        @Expect(m.replace(ReentrantKey(1), { old => old + 1 }), Some(11))
        @Expect(m.get(ReentrantKey(1)), Some(12))
        @Expect(m.replace(ReentrantKey(1), { old => old > 0 }, { old => old * 2 }), Some(12))
        @Expect(m.get(ReentrantKey(1)), Some(24))
        @Expect(m.remove(ReentrantKey(1)), Some(24))
        @Expect(m.remove(ReentrantKey(1)), None)
        @Expect(m.remove(ReentrantKey(2), { v => v == 2 }), Some(2))
        @Expect(m.size, 0)
        @Expect(erIteratedCount(m), 0)
    }
}
