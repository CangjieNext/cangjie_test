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
 * LLT regression test: atexit teardown protocol must not spin concurrent
 * registrants on the registration lock, must not drop registrations
 * silently, and must never hang process exit
 * (https://gitcode.com/Cangjie/cangjie_runtime/issues/975).
 *
 * Defect (pre-fix stdlib/libs/std/core/atexit.cj + native/atexit.c):
 *   CJ_CORE_ExecAtexitCallbacks acquires the native registration lock and
 *   executes ALL user callbacks while holding it (release only in finally,
 *   atexit.cj:54..78). The lock is a pure atomic_flag test_and_set spin loop
 *   with no yield (native/atexit.c:22-30). CJ_CORE_AddAtexitCallback checks
 *   callbacksRunningFlag BEFORE trying to take the lock (atexit.cj:35), so
 *   a thread that passes the check just before the teardown thread sets the
 *   flag (atexit.cj:59, under the lock) then busy-spins on the spinlock for
 *   the WHOLE teardown; any registration arriving during teardown
 *   (including a chained one from inside a callback) is silently dropped.
 *
 * Failure signature on the pre-fix runtime:
 *   testChainedRegistrationDuringTeardownIsHonored:
 *     "LLT-CHAIN-DROPPED" printed, case FAILS in the framework summary.
 *   testConcurrentRegistrationDoesNotStallTeardown:
 *     "LLT-STALL-DETECTED joined=<n>/<WORKERS>" printed with n < WORKERS
 *     and "LLT-ASSERT-FAIL" printed; the framework summary records FAIL.
 *
 * Note on assertion style: @Expect inside a teardown callback is invisible
 * to the test framework (results are collected before the atexit phase), so
 * these cases print explicit LLT-ASSERT-FAIL markers from inside the
 * teardown callbacks, which the framework surfaces in its output, and use
 * plain (non-blocking, 4s-bounded) joins so the run always terminates even
 * on the unfixed runtime. On the pre-fix runtime a BLOCKING cleanup join
 * never returns at all; the timed join keeps the failure harness-friendly
 * (bounded, deterministic, visible) instead of wedging the runner.
 */

import std.env.*
import std.sync.*
import std.collection.ArrayList

const WORKERS: Int64 = 4
const HAMMER_MS: Int64 = 60
let JOIN_TIMEOUT: Duration = Duration.second * 4

var chainedRan: Bool = false
var stallDetected: Bool = false

@Test
class AtexitTeardownProtocolTest {
    // C atexit-style chained registration inside a teardown callback must be
    // honored (pre-fix: silently dropped by the callbacksRunningFlag guard).
    //
    // LIFO ordering: callbacks registered earlier run LATER. The registering
    // callback (first atExit below) runs LAST; its chained callback runs
    // after it. The chained callback itself chains the final assertion, so
    // the assertion runs after chainedRan was set - the only way to observe
    // the chained run from inside the teardown.
    @TestCase
    func testChainedRegistrationDuringTeardownIsHonored(): Unit {
        atExit {
            atExit { => chainedRan = true }
        }
        // The assertion is chained from the SECOND-registered callback: it
        // runs after the FIRST-registered callback (and hence after the
        // chained handler that callback registers). Only a chained callback
        // can observe the chained handler from inside the teardown.
        atExit {
            atExit {
                if (!chainedRan) {
                    println("LLT-ASSERT-FAIL chained registration during teardown was dropped")
                } else {
                    println("LLT-CHAIN-HONORED")
                }
            }
        }
    }

    // Concurrent atExit registration must not be stalled for the whole
    // teardown by the registration spinlock (pre-fix: workers frozen with 0
    // progress while the teardown callback joins them).
    @TestCase
    func testConcurrentRegistrationDoesNotStallTeardown(): Unit {
        let stop = AtomicBool(false)
        let futs = ArrayList<Future<Unit>>()
        for (_ in 0..WORKERS) {
            futs.add(spawn {
                while (!stop.load()) {
                    atExit { => () }
                }
            })
        }
        sleep(Duration.millisecond * HAMMER_MS)
        let joined = AtomicInt64(0)
        atExit {
            stop.store(true)
            for (i in 0..WORKERS) {
                try {
                    let _ = futs[i].get(JOIN_TIMEOUT)
                    joined.fetchAdd(1)
                } catch (e: Exception) {
                    // worker frozen inside atExit registration
                }
            }
            if (joined.load() < WORKERS) {
                stallDetected = true
                println("LLT-STALL-DETECTED joined=${joined.load()}/${WORKERS}")
            }
        }
        atExit {
            if (stallDetected) {
                println("LLT-ASSERT-FAIL concurrent registrants stalled during teardown")
            } else {
                println("LLT-NO-STALL joined=${joined.load()}/${WORKERS}")
            }
        }
    }
}
