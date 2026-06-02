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

@Test
class CountableTest {
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
     * Test description: interface Countable ::core
     * Test API:
     * extend IntNative <: Countable<IntNative>
     * extend Int64 <: Countable<Int64>
     * extend Int32 <: Countable<Int32>
     * extend Int16 <: Countable<Int16>
     * extend Int8 <: Countable<Int8>
     * extend UIntNative <: Countable<UIntNative>
     * extend UInt64 <: Countable<UInt64>
     * extend UInt32 <: Countable<UInt32>
     * extend UInt16 <: Countable<UInt16>
     * extend UInt8 <: Countable<UInt8>
     * extend Rune <: Countable<Rune>
     */
    @TestCase
    func testCountable(): Unit {
        @Expect(r'\0'.position(),0)
        let num1: IntNative = 1
        let num2: Int64 = 2
        let num3: Int32 = 3
        let num4: Int16 = 4
        let num5: Int8 = 5
        let num6: UIntNative = 6
        let num7: UInt64 = 7
        let num8: UInt32 = 8
        let num9: UInt16 = 9
        let num10: UInt8 = 10

        let res1 = num1.next(10)
        let res2 = num2.next(9)
        let res3 = num3.next(8)
        let res4 = num4.next(7)
        let res5 = num5.next(6)
        let res6 = num6.next(5)
        let res7 = num7.next(4)
        let res8 = num8.next(3)
        let res9 = num9.next(2)
        let res10 = num10.next(1)

        let tmp: Int64 = 11
        @Expect(res1.position(),tmp)
        @Expect(res2.position(),tmp)
        @Expect(res3.position(),tmp)
        @Expect(res4.position(),tmp)
        @Expect(res5.position(),tmp)
        @Expect(res6.position(),tmp)
        @Expect(res7.position(),tmp)

        @Expect(res7.position(),tmp)
        @Expect(res8.position(),tmp)
        @Expect(res9.position(),tmp)
        @Expect(res10.position(),tmp)

        let rs1 = num6.next(-1)
        let rs2 = num7.next(-2)
        let rs3 = num8.next(-3)
        let rs4 = num9.next(-4)
        let rs5 = num10.next(-5)

        let tmp1: Int64 = 5

        @Expect(rs1.position(),tmp1)
        @Expect(rs2.position(),tmp1)
        @Expect(rs3.position(),tmp1)
        @Expect(rs4.position(),tmp1)
        @Expect(rs5.position(),tmp1)
    }

    /*
     * Test description: interface Countable ::core
     * Test API:
     * extend IntNative <: Countable<IntNative>
     * extend Int64 <: Countable<Int64>
     * extend Int32 <: Countable<Int32>
     * extend Int16 <: Countable<Int16>
     * extend Int8 <: Countable<Int8>
     * extend UIntNative <: Countable<UIntNative>
     * extend UInt64 <: Countable<UInt64>
     * extend UInt32 <: Countable<UInt32>
     * extend UInt16 <: Countable<UInt16>
     * extend UInt8 <: Countable<UInt8>
     * extend Rune <: Countable<Rune>
     */
    @TestCase
    func testInvalidCountable(): Unit {
        var caseException01: ?Exception = None
        try {
            r'\u{0000}'.next(-1)
        } catch (e: OverflowException) {
            caseException01 = e
        }
        anomalyAssert(
            "testInvalidCountable_01",
            caseException01,
            "in Rune(num), num is not a valid Unicode scalar value!"
        )
        var caseException02: ?Exception = None
        try {
            r'\u{D7FF}'.next(1)
        } catch (e: OverflowException) {
            caseException02 = e
        }
        anomalyAssert(
            "testInvalidCountable_02",
            caseException02,
            "in Rune(num), num is not a valid Unicode scalar value!"
        )

        var caseException03: ?Exception = None
        try {
            r'\u{E000}'.next(-1)
        } catch (e: OverflowException) {
            caseException03 = e
        }
        anomalyAssert(
            "testInvalidCountable_03",
            caseException03,
            "in Rune(num), num is not a valid Unicode scalar value!"
        )
    }
}
