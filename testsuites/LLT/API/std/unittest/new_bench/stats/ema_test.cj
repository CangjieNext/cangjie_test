/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Unit tests for the internal `Ema` (exponential moving average) helper used
// during benchmark warmup/estimation. Reaches the protected type via a `std.*`
// test package (same module as `std.unittest`); see sample_test.cj for the
// rationale.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.bench_stat_test

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class EmaTest {
    // With maxLength = 3, the EMA acts as a plain running average for the
    // first (maxLength-1) = 2 appended values, then transitions into EMA mode.
    @TestCase
    func averageThenEmaTransition(): Unit {
        var e = Ema(3)

        e.append(1.0)
        // (0 * 0 + 1) / 1 = 1.0, length 0 -> 1
        @Expect(e.result, 1.0, delta: 1e-9)
        @Expect(!e.reachedMax())

        e.append(2.0)
        // (1.0 * 1 + 2) / 2 = 1.5, length 1 -> 2 (== maxLength - 1)
        @Expect(e.result, 1.5, delta: 1e-9)
        @Expect(e.reachedMax())

        e.append(3.0)
        // length capped at 2: (1.5 * 2 + 3) / 3 = 2.0
        @Expect(e.result, 2.0, delta: 1e-9)
        @Expect(e.reachedMax())

        e.append(4.0)
        // EMA phase: (2.0 * 2 + 4) / 3 = 8/3
        @Expect(e.result, 8.0 / 3.0, delta: 1e-9)
    }

    @TestCase
    func resetClearsState(): Unit {
        var e = Ema(3)
        e.append(10.0)
        e.append(20.0)
        @Expect(e.reachedMax())
        e.reset()
        @Expect(e.result, 0.0, delta: 1e-9)
        @Expect(!e.reachedMax())
    }

    @TestCase
    func freshEmaNotAtMax(): Unit {
        let e = Ema(3)
        @Expect(!e.reachedMax())
        @Expect(e.result, 0.0, delta: 1e-9)
    }
}
