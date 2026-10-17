/*
 * Copyright (c) 2026 Chaos John. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

/*
 * LLT regression test: ConcurrentHashMap re-entrant same-bucket callback
 * loses the inner update (Cangjie/cangjie_runtime issue: entryView/replace/
 * remove stale CoW snapshot).
 *
 * Defect: Bucket.copyEntryView (and the copyReplace/copyRemove paths) take a
 * pre-callback snapshot of the bucket's KVList and store that snapshot back
 * after the user callback returns. The bucket mutex is reentrant, so the
 * callback may call back into the SAME map (same bucket) - e.g. via add() or
 * remove() on a key that hashes into the same bucket. Those inner updates are
 * committed by the inner call, but the outer entryView then overwrites the
 * bucket with the stale pre-callback snapshot:
 *   - an inner add() of a same-bucket key is silently LOST (its Some(prev)
 *     return value still reports success);
 *   - an inner remove() of a same-bucket key is undone: the entry is
 *     RESURRECTED even though remove returned Some(v) and contains() was
 *     already false inside the callback.
 *
 * This violates the documented atomicity: add() "If the key already exists,
 * the value will be overwritten" and returns Some(prev) on success, and
 * entryView is the recommended (non-deprecated) atomic read-modify-write API.
 *
 * Reproduction is single-threaded and deterministic: both keys use a constant
 * hashCode(), a legal (if degenerate) implementation, so they share one bucket
 * at every table size (avoiding the incidental table resize 16->32 that would
 * otherwise separate the buckets after the first add).
 *
 * On the unfixed library both @Assert(failures) fire: the inner add is lost
 * and the removed entry is resurrected. With the fix the inner updates
 * survive (the callback-time state is preserved).
 */

import std.collection.concurrent.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

class CollKey <: Hashable & Equatable<CollKey> {
    let id: Int64
    init(id: Int64) { this.id = id }
    /* Deliberate constant hash: every CollKey collides into one bucket.
     * Legal Hashable implementation (Java-style contract allows it), and it
     * makes the same-bucket re-entrancy deterministic instead of dependent
     * on incidental table sizing. */
    public func hashCode(): Int64 { return 1 }
    public operator func ==(other: CollKey): Bool { return this.id == other.id }
}

@Test
class ChmReentrantEntryViewTest {
    /* Scenario A: entryView(k2) callback re-entrantly add(k1, 999).
     * The inner add must survive: get(k1) == Some(999) after entryView. */
    @TestCase
    func testInnerAddUnderEntryViewSurvives(): Unit {
        let m = ConcurrentHashMap<CollKey, Int64>()
        let k1 = CollKey(1)
        let k2 = CollKey(2)
        m.add(k1, 1)

        let outerRet = m.entryView(k2, { ev: MapEntryView<CollKey, Int64> =>
            let inner = m.add(k1, 999)
            /* The inner add is documented to succeed and report the old value */
            @Assert(inner == Some(1))
            /* Immediately visible inside the callback */
            @Assert(m.get(k1) == Some(999))
            ev.value = Some(100)
        })

        /* entryView on the absent k2 with ev.value set => Some(100) */
        @Expect(outerRet, Some(100))
        /* THE BUG: the outer entryView stores its stale pre-callback snapshot,
         * clobbering the inner add - k1 reverts to the old value 1. */
        @Expect(m.get(k1), Some(999))
        @Expect(m.get(k2), Some(100))
        @Expect(m.size, 2)
    }

    /* Scenario B: entryView(k2) callback re-entrantly remove(k1).
     * The inner remove must survive: get(k1) == None after entryView. */
    @TestCase
    func testInnerRemoveUnderEntryViewSurvives(): Unit {
        let m = ConcurrentHashMap<CollKey, Int64>()
        let k1 = CollKey(1)
        let k2 = CollKey(2)
        m.add(k1, 1)

        m.entryView(k2, { ev: MapEntryView<CollKey, Int64> =>
            let r = m.remove(k1)
            /* The inner remove is documented to succeed */
            @Assert(r == Some(1))
            /* Already gone inside the callback */
            @Assert(m.get(k1) == None<Int64>)
            @Assert(!m.contains(k1))
            ev.value = Some(100)
        })

        /* THE BUG: the outer entryView stores its stale pre-callback snapshot,
         * resurrecting the removed k1 entry. */
        @Expect(m.get(k1), None<Int64>)
        @Expect(m.contains(k1), false)
        @Expect(m.size, 1)
        var iterated = 0
        for (_ in m) { iterated++ }
        @Expect(iterated, 1)
    }

    /* Scenario C: control - the same operations performed sequentially
     * (no re-entrancy) behave correctly, pinning the expected semantics. */
    @TestCase
    func testSequentialControl(): Unit {
        let m = ConcurrentHashMap<CollKey, Int64>()
        let k1 = CollKey(1)
        let k2 = CollKey(2)
        m.add(k1, 1)
        let prev = m.add(k1, 999)
        @Expect(prev, Some(1))
        m.add(k2, 100)
        @Expect(m.get(k1), Some(999))
        @Expect(m.get(k2), Some(100))
        @Expect(m.size, 2)
    }
}
