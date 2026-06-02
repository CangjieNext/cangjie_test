/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC: %run %run_opt %output %run_args
import std.math.*
import std.convert.*
import std.math.numeric.*

@Test
class RoundingModeTest {
    @TestCase
    func testRoundingMode(): Unit {
        @Expect(RoundingMode.Ceiling.toString(), "Ceiling")
        @Expect(RoundingMode.Down.toString(), "Down")
        @Expect(RoundingMode.Floor.toString(), "Floor")
        @Expect(RoundingMode.HalfEven.toString(), "HalfEven")
        @Expect(RoundingMode.HalfUp.toString(), "HalfUp")
        @Expect(RoundingMode.Up.toString(), "Up")
    }

    @TestCase
    func testRoundingMode1(): Unit {
        @Expect(RoundingMode.Ceiling == RoundingMode.Ceiling, true)
        @Expect(RoundingMode.Down == RoundingMode.Down, true)
        @Expect(RoundingMode.Floor == RoundingMode.Floor, true)
        @Expect(RoundingMode.HalfEven == RoundingMode.HalfEven, true)
        @Expect(RoundingMode.HalfUp == RoundingMode.HalfUp, true)
        @Expect(RoundingMode.Up == RoundingMode.Up, true)
        @Expect(RoundingMode.HalfEven == RoundingMode.Ceiling, false)
        @Expect(RoundingMode.HalfUp == RoundingMode.Down, false)
        @Expect(RoundingMode.Up == RoundingMode.Floor, false)
    }

    @TestCase
    func testOverflowStrategy(): Unit {
        @Expect(OverflowStrategy.Saturating == OverflowStrategy.Saturating, true)
        @Expect(OverflowStrategy.Throwing == OverflowStrategy.Throwing, true)
        @Expect(OverflowStrategy.Wrapping == OverflowStrategy.Wrapping, true)
        @Expect(OverflowStrategy.Saturating == OverflowStrategy.Throwing, false)
        @Expect(OverflowStrategy.Throwing == OverflowStrategy.Wrapping, false)
        @Expect(OverflowStrategy.Wrapping == OverflowStrategy.Saturating, false)
    }

    @TestCase
    func testOverflowStrategy1(): Unit {
        @Expect(OverflowStrategy.Saturating.toString(), "Saturating")
        @Expect(OverflowStrategy.Throwing.toString(), "Throwing")
        @Expect(OverflowStrategy.Wrapping.toString(), "Wrapping")
    }
}
