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
 * LLT regression test: ConcurrentHashMap resize exception safety.
 *
 * Defect (fixed by Cangjie/cangjie_runtime PR for issue #916):
 * stdlib/libs/std/collection/concurrent/concurrent_hash_map.cj - the resize
 * protocol (tryResize) has no handling for a stripe migration that throws
 * (e.g. OutOfMemoryError from the transfer allocation in KVList.migrate <-
 * Bucket.migrate <- HNode.migrate):
 *   1. the throwing stripe's claim (migratingIndex.fetchAdd(1)) is consumed
 *      but never accounted, so migratedIndex can never reach
 *      concurrencyLevel and the thread that won the version CAS spins
 *      forever in `while (curHT.migratedIndex.load() < concurrencyLevel) {}`
 *      (permanent CPU burn, the add() call never returns);
 *   2. HNode.migrate holds the stripe mutex without try/finally, so the
 *      throw leaks it: every later writer whose key hashes to that stripe
 *      blocks forever;
 *   3. the new table is never published (head never advances), the map is
 *      permanently wedged.
 *
 * Test strategy: deterministic fault injection at the exact site a real
 * allocation failure strikes during a stripe migration - the transfer
 * allocation in KVList.migrate. The materialized library under test is the
 * pristine std.collection.concurrent package (package renamed hchm; the
 * LLT harness compiles this scenario together with the package sources) +
 * ONE inert one-shot failpoint that, when armed, performs a real allocation
 * that cannot be satisfied, so the RUNTIME ITSELF throws the genuine
 * OutOfMemoryError. No protocol logic is touched.
 *
 * Determinism of the public-API call sequence (Int64.hashCode is identity):
 *   default map: 16 buckets, concurrencyLevel 16; counts stripe = hash & 15;
 *   a second add on counts stripe 0 crosses the resize threshold
 *   ((1 << 4) >= 16) and enters tryResize.
 *
 * Cases:
 *   - testControlResizeHealth: identical call sequence with the failpoint
 *     never armed completes healthily (resize chain finishes, head version
 *     3, size 6, reads correct) - proves the harness itself is sound;
 *   - testMigrationThrowDoesNotWedge: with the failpoint armed once, the
 *     failing add() still throws OutOfMemoryError (propagated to the
 *     caller), but no other thread may hang: the winner's add() returns,
 *     writers on the poisoned stripe return, and the map stays consistent
 *     (all data readable). On the pre-fix library the winner spins forever
 *     in tryResize and stripe-0 writers block forever - the test times out
 *     (LLT run timeout), which is the recorded failure signature.
 */

package hchm

import std.sync.*
import std.time.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

/* ===== fault injection (harness only, no protocol logic) ================== */

/* One-shot failpoint: when armed, the next migration transfer allocation
 * performs a real allocation that cannot be satisfied, so the runtime
 * itself throws the genuine OutOfMemoryError from its allocation-failure
 * path - the same exception real memory pressure raises at this site.
 * chmFaultMode selects the flavor:
 *   1: heap-cap - an allocation above the GC heap cap (~232MB here) fails
 *      after the scenario exhausts the heap with ballast (zero new
 *      allocation to arm the fault, zero-allocation shed afterwards);
 *   2: overcommit + commit-limit - a 2GB request fails instantly without
 *      any ballast on machines whose memory commit limit is below 2GB.
 * Both flavors throw the same genuine runtime OutOfMemoryError.
 * chmFaultArmed / chmFaultMode are DECLARED by the injected failpoint in
 * the library under test (see the LLT harness); they are not redeclared
 * here so the harness and the test share one instance. */

/* Exhaust the GC heap with 32MB blocks (zero new allocation when arming). */
func exhaustHeapForFault(): ArrayList<Array<UInt8>> {
    let ballast = ArrayList<Array<UInt8>>()
    try {
        while (true) {
            ballast.add(Array<UInt8>(32 * 1_048_576, repeat: 0))
        }
    } catch (e: Error) {
        // expected: GC heap cap reached
    }
    return ballast
}

/* Flag helper: wait up to ms for f to become true. */
func waitFlag(f: AtomicBool, ms: Int64): Bool {
    let deadline = MonoTime.now() + Duration.millisecond * ms
    while (MonoTime.now() < deadline) {
        if (f.load()) { return true }
        sleep(Duration.millisecond * 10)
    }
    return f.load()
}

@Test
class ChmResizeExceptionSafetyTest {
    /* ---------- Case A: control (fault never armed) ---------- */
    @TestCase
    func testControlResizeHealth(): Unit {
        let c = ConcurrentHashMap<Int64, Int64>()
        let _ = c.add(0, 100)    // hash 0  -> T0 bucket 0; counts[0] = 1
        let _ = c.add(16, 101)   // hash 16 -> counts[0] = 2: resize #1 (pre empty), T1(32, v1) published
        let _ = c.add(32, 102)   // resize #2: stripe 0 transfers T0.buckets[0] into T1, T2(64, v2) published
        let _ = c.add(48, 103)   // on-demand migration on T2, returns
        let _ = c.add(64, 104)   // resize #3 (real transfers), T3(128, v3) published
        let _ = c.add(3, 105)    // healthy stripe, returns
        @Expect(c.size, 6)
        @Expect(c.get(0), Some(100))
        @Expect(c.get(64), Some(104))
        @Expect(c.get(3), Some(105))
        @Expect(c.head.load().version, 3)  // resize chain completed
    }

    /* ---------- Case B: migration throw must not wedge the map ---------- */
    @TestCase
    func testMigrationThrowDoesNotWedge(): Unit {
        let m = ConcurrentHashMap<Int64, Int64>()
        let _ = m.add(0, 100)    // T0 bucket 0; counts[0] = 1
        let _ = m.add(16, 101)   // resize #1 -> T1(32 buckets, v1, pre = T0 holding key 0); counts[0] = 2

        // L: arm the fault; the next migration-transfer allocation fails.
        let ballast = if (chmFaultMode == 1) { exhaustHeapForFault() } else { ArrayList<Array<UInt8>>() }
        chmFaultArmed.store(true)
        var lCaught = ""
        try {
            let _ = m.add(32, 102)  // enters tryResize on T1; stripe-0 transfer throws OutOfMemoryError
        } catch (e: Error) {
            lCaught = "${e}"
        }
        // zero-allocation shed: everything below runs with memory available
        ballast.clear()
        let lOk = lCaught.contains("OutOfMemoryError")
        @Assert(lOk)

        // W: another adder on counts stripe 0 - completes the remaining
        // stripes, wins the version CAS, and would spin forever on the
        // pre-fix library (migratedIndex stuck at 15/16).
        let wDone = AtomicBool(false)
        spawn {
            let _ = m.add(48, 103)
            wDone.store(true)
        }
        let wReturned = waitFlag(wDone, 3000)
        @Assert(wReturned)

        // V: writer on the poisoned stripe 0 - blocked forever on the
        // stripe mutex leaked by the throwing HNode.migrate pre-fix.
        let vDone = AtomicBool(false)
        spawn {
            let _ = m.add(64, 104)
            vDone.store(true)
        }
        let vReturned = waitFlag(vDone, 3000)
        @Assert(vReturned)

        // U: healthy-stripe writer still works.
        let _ = m.add(3, 105)

        // Data integrity: everything written before the fault must be
        // readable (reads fall back one level while the old table is
        // authoritative), and post-fault writes must land.
        @Expect(m.get(0), Some(100))
        @Expect(m.get(16), Some(101))
        @Expect(m.get(3), Some(105))
    }
}
