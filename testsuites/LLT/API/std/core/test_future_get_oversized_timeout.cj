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
 * LLT regression test: Future.get(timeout:) must clamp oversized timeouts
 * (Cangjie/cangjie_runtime issue #986, finding CR-23).
 *
 * Defect: Future.get(timeout: Duration) passed timeout.toNanoseconds()
 * unclamped to the native futureWait. Any timeout above Int64.Max nanoseconds
 * (including the public constant Duration.Max, the idiomatic "wait forever"
 * sentinel) threw ArithmeticException("The duration in nanosecond exceeds the
 * range of 'Int64'.") whenever the future was not yet complete, while the
 * same call returned normally when the future had already finished. The
 * exception was undocumented and the failure was completion-order dependent.
 *
 * Every sibling timed API already clamps: sleep(), Monitor.wait,
 * NotifyOnce.wait, and std.process getWaitExitCode even pre-clamps before
 * calling future.get. The fix clamps timeout > MAX_TIMEOUT_DURATION to
 * MAX_TIMEOUT_NS inside get(timeout:) and documents the behavior.
 *
 * Single-threaded, deterministic (no timing-dependent assertions except
 * generous sleeps well below the wait bounds).
 */

main(): Int64 {
    var failures = 0

    // T1: oversized timeout (Duration.Max) on an INCOMPLETE future must block
    //     until completion and return the value. Before the fix this threw
    //     ArithmeticException (completion-order dependent abort).
    let f1 = spawn {
        sleep(Duration.millisecond * 300)
        11
    }
    try {
        let v = f1.get(Duration.Max)
        if (v != 11) {
            println("T1 FAIL: wrong value ${v}")
            failures += 1
        } else {
            println("T1 PASS: get(Duration.Max) blocked until completion and returned 11")
        }
    } catch (e: ArithmeticException) {
        println("T1 FAIL: ArithmeticException leaked: ${e}")
        failures += 1
        f1.cancel()
    } catch (e: Exception) {
        println("T1 FAIL: unexpected ${e}")
        failures += 1
        f1.cancel()
    }

    // T2: boundary - exactly Int64.Max nanoseconds must keep working.
    let f2 = spawn {
        sleep(Duration.millisecond * 200)
        22
    }
    try {
        let v = f2.get(Duration.nanosecond * Int64.Max)
        if (v != 22) {
            println("T2 FAIL: wrong value ${v}")
            failures += 1
        } else {
            println("T2 PASS: get(exactly Int64.Max ns) returned 22")
        }
    } catch (e: Exception) {
        println("T2 FAIL: unexpected ${e}")
        failures += 1
        f2.cancel()
    }

    // T3: oversized above the boundary (~548 years, Int64.Max ns is ~292.5
    //     years, so 200000 days in ns EXCEEDS Int64.Max and toNanoseconds()
    //     threw pre-fix). Post-fix it is clamped and returns the value.
    let f3 = spawn {
        sleep(Duration.millisecond * 200)
        33
    }
    try {
        let v = f3.get(Duration.day * 200000)
        if (v != 33) {
            println("T3 FAIL: wrong value ${v}")
            failures += 1
        } else {
            println("T3 PASS: get(Duration.day * 200000) returned 33 (clamped, no ArithmeticException)")
        }
    } catch (e: ArithmeticException) {
        println("T3 FAIL: ArithmeticException leaked: ${e}")
        failures += 1
        f3.cancel()
    } catch (e: Exception) {
        println("T3 FAIL: unexpected ${e}")
        failures += 1
        f3.cancel()
    }

    // T4: short timeout on an incomplete future must still throw
    //     TimeoutException (regression guard for the fix).
    let f4 = spawn {
        sleep(Duration.second * 10)
        44
    }
    try {
        let v = f4.get(Duration.millisecond * 100)
        println("T4 FAIL: expected TimeoutException, got ${v}")
        failures += 1
        f4.cancel()
    } catch (e: TimeoutException) {
        println("T4 PASS: TimeoutException still thrown for short timeout")
        f4.cancel()
    } catch (e: Exception) {
        println("T4 FAIL: unexpected ${e}")
        failures += 1
        f4.cancel()
    }

    // T5: completed future + oversized timeout -> immediate value.
    let f5 = spawn { 55 }
    sleep(Duration.millisecond * 200)
    try {
        let v = f5.get(Duration.Max)
        if (v != 55) {
            println("T5 FAIL: wrong value ${v}")
            failures += 1
        } else {
            println("T5 PASS: get(Duration.Max) on completed future returned 55")
        }
    } catch (e: Exception) {
        println("T5 FAIL: unexpected ${e}")
        failures += 1
    }

    // T6: worker exception still propagates through get(timeout:).
    let f6 = spawn {
        throw IllegalStateException("worker boom")
    }
    sleep(Duration.millisecond * 200)
    try {
        let v = f6.get(Duration.Max)
        println("T6 FAIL: expected worker exception, got a value")
        failures += 1
    } catch (e: IllegalStateException) {
        println("T6 PASS: worker exception propagated through get(Duration.Max)")
    } catch (e: Exception) {
        println("T6 FAIL: unexpected ${e}")
        failures += 1
    }

    if (failures != 0) {
        println("TOTAL: ${failures} failure(s)")
        return 1
    }
    println("TOTAL: all 6 cases passed")
    return 0
}
