/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*
import std.math.numeric.*

/*
 * Test description: Test the enum for math
 * Test enum:
 *     public enum RoundingMode
 *     public enum OverflowStrategy
 */
@Test
class EnumTest {
    let mode = [RoundingMode.Ceiling, RoundingMode.Floor, RoundingMode.HalfEven, RoundingMode.Down, RoundingMode.HalfUp,
        RoundingMode.Up]
    let strategy = [OverflowStrategy.Saturating, OverflowStrategy.Throwing, OverflowStrategy.Wrapping]

    @TestCase
    func testEnumRoundingModeEquatable(): Unit {
        for (i in 0..mode.size) {
            @Expect(mode[i] == mode[i])
        }

        for (i in 0..mode.size) {
            for (j in 0..mode.size where i != j) {
                @Expect(mode[i] != mode[j])
            }
        }
    }

    @TestCase
    func testEnumRoundingModeToString(): Unit {
        @Expect(RoundingMode.Ceiling.toString(), "Ceiling")
        @Expect(RoundingMode.Down.toString(), "Down")
        @Expect(RoundingMode.Floor.toString(), "Floor")
        @Expect(RoundingMode.HalfEven.toString(), "HalfEven")
        @Expect(RoundingMode.HalfUp.toString(), "HalfUp")
        @Expect(RoundingMode.Up.toString(), "Up")
    }

    @TestCase
    func testEnumOverflowStrategyEquatable(): Unit {
        for (i in 0..strategy.size) {
            @Expect(strategy[i] == strategy[i])
        }

        for (i in 0..strategy.size) {
            for (j in 0..strategy.size where i != j) {
                @Expect(strategy[i] != strategy[j])
            }
        }
    }

    @TestCase
    func testEnumOverflowStrategyToString(): Unit {
        @Expect(OverflowStrategy.Saturating.toString(), "Saturating")
        @Expect(OverflowStrategy.Throwing.toString(), "Throwing")
        @Expect(OverflowStrategy.Wrapping.toString(), "Wrapping")
    }
}
