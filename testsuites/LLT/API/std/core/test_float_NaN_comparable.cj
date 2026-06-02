/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output %run_args

@Test
class ComparableTest {
    static func notEquals<T>(unexpected: T, actual: T): Bool where T <: Comparable<T> {
        if (unexpected != actual) {
            return true;
        } else {
            return false;
        }
    }

    static func less<T>(expected: T, actual: T): Bool where T <: Comparable<T> {
        if (expected < actual) {
            return true;
        } else {
            return false;
        }
    }

    static func greater<T>(expected: T, actual: T): Bool where T <: Comparable<T> {
        if (expected > actual) {
            return true;
        } else {
            return false;
        }
    }

    static func lessOrEqual<T>(expected: T, actual: T): Bool where T <: Comparable<T> {
        if (expected <= actual) {
            return true;
        } else {
            return false;
        }
    }

    static func greaterOrEqual<T>(expected: T, actual: T): Bool where T <: Comparable<T> {
        if (expected >= actual) {
            return true;
        } else {
            return false;
        }
    }

    static func equals<T>(expected: T, actual: T): Bool where T <: Comparable<T> {
        if (expected == actual) {
            return true;
        } else {
            return false;
        }
    }

    static func testNaN<T>(number: T, NaN: T) where T <: Comparable<T> {
        @Expect(ComparableTest.less(number, NaN) == false)
        @Expect(ComparableTest.less(NaN, number) == false)
        @Expect(ComparableTest.less(NaN, NaN) == false)

        @Expect(ComparableTest.greater(number, NaN) == false)
        @Expect(ComparableTest.greater(NaN, number) == false)
        @Expect(ComparableTest.greater(NaN, NaN) == false)

        @Expect(ComparableTest.lessOrEqual(number, NaN) == false)
        @Expect(ComparableTest.lessOrEqual(NaN, number) == false)
        @Expect(ComparableTest.lessOrEqual(NaN, NaN) == false)

        @Expect(ComparableTest.greaterOrEqual(number, NaN) == false)
        @Expect(ComparableTest.greaterOrEqual(NaN, number) == false)
        @Expect(ComparableTest.greaterOrEqual(NaN, NaN) == false)

        @Expect(ComparableTest.equals(number, NaN) == false)
        @Expect(ComparableTest.equals(NaN, number) == false)
        @Expect(ComparableTest.equals(NaN, NaN) == false)

        @Expect(ComparableTest.notEquals(number, NaN) == true)
        @Expect(ComparableTest.notEquals(NaN, number) == true)
        @Expect(ComparableTest.notEquals(NaN, NaN) == true)
    }

    @TestCase
    func testFloat16Comp(): Unit {
        ComparableTest.testNaN(Float16.Max, Float16.NaN)
        ComparableTest.testNaN(Float16.Inf, Float16.NaN)
    }

    @TestCase
    func testFloat32Comp(): Unit {
        ComparableTest.testNaN(Float32.Max, Float32.NaN)
        ComparableTest.testNaN(Float32.Inf, Float32.NaN)
    }

    @TestCase
    func testFloat64Comp(): Unit {
        ComparableTest.testNaN(Float64.Max, Float64.NaN)
        ComparableTest.testNaN(Float64.Inf, Float64.NaN)
    }
}
