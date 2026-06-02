/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

var gv_zero = 0

@Test
class RangeTest {
    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message == expectMessage) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: Test extend<T> Range<T> <: Equatable<Range<T>> where T <: Countable<T> & Comparable<T> & Equatable<T>
     * Test API:
     * public operator func ==(that: Range<T>): Bool
     * public operator func !=(that: Range<T>): Bool
     */
    @TestCase
    func testRangeEquatable(): Unit {
        let r1 = 0..10 : 1
        let r2 = 0..10 : 1
        let r3 = 0..10 : 2
        let r4 = 1..10 : 1
        let r5 = 0..9 : 1
        let r6 = 0..=10 : 1

        if (!(r1 == r2) || !(r1 != r3) || !(r1 != r4) || !(r1 != r5) || !(r1 != r6)) {
            @Expect(false)
        } else {
            @Expect(true)
        }
    }

    /*
     * Test description: Test extend<T> Range<T> <: Equatable<Range<T>> where T <: Countable<T> & Comparable<T> & Equatable<T>
     * Test API:
     * public func next(): Option<T>
     *
     */
    @TestCase
    func testRangeNext(): Unit {
        var ran1 = Range<Int64>(1, 5, 1, true, true, false)
        var ran2 = Range<Int64>(5, 1, -1, true, true, true)
        var ran3 = Range<Int64>(1, 6, 2, true, true, true)
        var ran4 = Range<Int64>(6, 1, -2, true, true, true)

        var iter1 = ran1.iterator()
        var iter2 = ran2.iterator()
        var iter3 = ran3.iterator()
        var iter4 = ran4.iterator()

        for (i in 0..3) {
            @Expect(iter3.next(),Some(i * 2 + 1))
            @Expect(iter4.next(),Some(6 - i * 2))
        }

        for (i in 0..4) {
            @Expect(iter1.next(),Some(i + 1))
            @Expect(iter2.next(), Some(5 - i))
        }
        @Expect(iter2.iterator().next(),Some(1))
        @Expect(iter1.next(),None)
        @Expect(iter2.next(),None)
        @Expect(iter3.next(),None)
        @Expect(iter4.next(),None)
    }

    /*
     * Test description: Test extend<T> Range<T> <: Equatable<Range<T>> where T <: Countable<T> & Comparable<T> & Equatable<T>
     * Test API:
     * public init(start: T, end: T, step: Int64, hasStart: Bool, hasEnd: Bool, isClosed: Bool)
     *
     */
    @TestCase
    func testInvalidRangeInit(): Unit {
        var caseException01: ?Exception = None
        try {
            Range<Int64>(1, 2, gv_zero, true, true, true)
            ()
        } catch (e: IllegalArgumentException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidRangeInit_01",
            caseException01,
            "The value of the step should not be zero."
        )
    }
}
