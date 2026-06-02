/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
@Test
class ComparableTest {
    /*
     * Test description: Test extend Ordering <: Comparable<Ordering>  ::core
     * Test API:
     * public operator func ==(that: Ordering): Bool
     * public operator func !=(that: Ordering): Bool
     * public operator func <(that: Ordering): Bool
     * public operator func >=(that: Ordering): Bool
     * public operator func >(that: Ordering): Bool
     * public func compare(that: Ordering): Ordering
     */
    @TestCase
    func testOrdering(): Unit {
        let eq = Ordering.EQ
        let gt = Ordering.GT
        let lt = Ordering.LT
        let eq2 = Ordering.EQ
        let gt2 = Ordering.GT
        let lt2 = Ordering.LT
        @Expect(eq,eq2)
        @Expect(gt,gt2)
        @Expect(lt,lt2)
        @Expect(eq.compare(lt) ,Ordering.GT)

        @Expect(gt.compare(lt)  ,Ordering.GT)

        @Expect(gt.compare(eq) ,Ordering.GT)

        @Expect(lt.compare(eq) ,Ordering.LT)
        @Expect(lt.compare(gt),Ordering.LT)
        @Expect(eq.compare(gt)  ,Ordering.LT)

        @Expect(eq < gt)

        @Expect(!(eq >= gt))
        @Expect(eq > lt)
        @Expect(!(gt <= lt))

        @Expect((eq == eq2)&&(gt == gt2)&&(lt == lt2))
        @Expect(eq.compare(eq2) == Ordering.EQ)

        @Expect(lt.compare(lt2) == Ordering.EQ)

        @Expect(gt.compare(gt2) == Ordering.EQ)
    }

    /*
     * Test description: Test extend Comparable  ::core
     * Test API:
     * extend IntNative <: Comparable<IntNative>
     * extend Int32 <: Comparable<Int32>
     * extend Int16 <: Comparable<Int16>
     * extend Int8 <: Comparable<Int8>
     * UIntNative <: Comparable<UIntNative>
     * UInt64 <: Comparable<UInt64>
     * UInt32 <: Comparable<UInt32>
     * UInt16 <: Comparable<UInt16>
     * UInt8 <: Comparable<UInt8>
     * Float16 <: Comparable<Float16>
     * Float32 <: Comparable<Float32>
     * Float64 <: Comparable<Float64>
     */
    @TestCase
    func testComparable(): Unit {
        let int1: Int64 = 2147483648
        let int2: Int64 = 2147483648
        let int3: Int64 = 2147483649
        let int4: Int64 = -2147483649

        @Expect((int1.compare(int2) == Ordering.EQ)&&(int1.compare(int3) == Ordering.LT)&&(int1.compare(int4) == Ordering.GT))

        let int5: Int32 = 32768
        let int6: Int32 = 32768
        let int7: Int32 = 327689
        let int8: Int32 = -327689
        @Expect((int5.compare(int6) == Ordering.EQ)&&(int5.compare(int7) == Ordering.LT)&&(int5.compare(int8) == Ordering.GT))

        let int9: Int16 = 128
        let int10: Int16 = 128
        let int11: Int16 = 129
        let int12: Int16 = -129
        @Expect((int9.compare(int10) == Ordering.EQ)&&(int9.compare(int11) == Ordering.LT)&&(int9.compare(int12) == Ordering.GT))

        let int13: Int8 = 1
        let int14: Int8 = 1
        let int15: Int8 = 2
        let int16: Int8 = -2
        @Expect((int13.compare(int14) == Ordering.EQ)&&(int13.compare(int15) == Ordering.LT)&&(int13.compare(int16) == Ordering.GT))

        let uint1: UInt64 = 2147483648
        let uint2: UInt64 = 2147483648
        let uint3: UInt64 = 2147483649
        let uint4: UInt64 = 2147483647
        @Expect((uint1.compare(uint2) == Ordering.EQ)&&(uint1.compare(uint3) == Ordering.LT)&&(uint1.compare(uint4) == Ordering.GT))

        let uint5: UInt32 = 327688
        let uint6: UInt32 = 327688
        let uint7: UInt32 = 327689
        let uint8: UInt32 = 327687
        @Expect((uint5.compare(uint6) == Ordering.EQ)&&(uint5.compare(uint7) == Ordering.LT)&&(uint5.compare(uint8) == Ordering.GT))

        let uint9: UInt16 = 128
        let uint10: UInt16 = 128
        let uint11: UInt16 = 129
        let uint12: UInt16 = 127

        @Expect((uint9.compare(uint10) == Ordering.EQ)&&(uint9.compare(uint11) == Ordering.LT)&&(uint9.compare(uint12) == Ordering.GT))

        let uint13: UInt8 = 1
        let uint14: UInt8 = 1
        let uint15: UInt8 = 2
        let uint16: UInt8 = 0
        @Expect((uint13.compare(uint14) == Ordering.EQ)&&(uint13.compare(uint15) == Ordering.LT)&&(uint13.compare(uint16) == Ordering.GT))

        @Expect((uint13.compare(uint14) == Ordering.EQ)&&(uint13.compare(uint15) == Ordering.LT)&&(uint13.compare(uint16) == Ordering.GT))

        let float1: Float64 = 2e3
        let float2: Float64 = 2e3
        let float3: Float64 = 3e3
        let float4: Float64 = 1e3
        @Expect((float1.compare(float2) == Ordering.EQ) &&(float1.compare(float3) == Ordering.LT) &&(float1.compare(float4) == Ordering.GT))

        let float5: Float32 = 2e3
        let float6: Float32 = 2e3
        let float7: Float32 = 3e3
        let float8: Float32 = 1e3
        @Expect((float5.compare(float6) == Ordering.EQ) &&(float5.compare(float7) == Ordering.LT) &&(float5.compare(float8) == Ordering.GT))

        let float9: Float16 = 2e3
        let float10: Float16 = 2e3
        let float11: Float16 = 3e3
        let float12: Float16 = 1e3
        @Expect((float9.compare(float10) == Ordering.EQ) &&(float9.compare(float11) == Ordering.LT) &&(float9.compare(float12) == Ordering.GT))

        let n1: IntNative = 2
        let n2: IntNative = 2
        let n3: IntNative = 3
        let n4: IntNative = 1
        @Expect((n1.compare(n2) == Ordering.EQ) &&(n1.compare(n3) == Ordering.LT) &&(n1.compare(n4) == Ordering.GT))

        let n5: UIntNative = 2
        let n6: UIntNative = 2
        let n7: UIntNative = 3
        let n8: UIntNative = 1
        @Expect((n5.compare(n6) == Ordering.EQ) &&(n5.compare(n7) == Ordering.LT) &&(n5.compare(n8) == Ordering.GT))
    }

    /*
     * Test description: Test extend Ordering <: Comparable<Ordering>  ::core
     * Test API:
     * public operator func ==(that: Ordering): Bool
     * public operator func !=(that: Ordering): Bool
     * public operator func <(that: Ordering): Bool
     * public operator func >=(that: Ordering): Bool
     * public operator func >(that: Ordering): Bool
     * public func compare(that: Ordering): Ordering
     */
    @TestCase
    func testToString(): Unit {
        let eq = Ordering.EQ
        let gt = Ordering.GT
        let lt = Ordering.LT

        @Expect(gt.toString(),"Ordering.GT")
        @Expect(lt.toString(),"Ordering.LT")
        @Expect(eq.toString(),"Ordering.EQ")
    }

    @TestCase
    func testDefaultImpl(): Unit {
        let a1 = A(1)
        let a2 = A(2)
        let a1_1 = A(1)
        @Expect(a1 == a2, false)
        @Expect(a1 == a1_1, true)
        @Expect(a1 != a2, true)
        @Expect(a1 != a1_1, false)
        @Expect(a1 < a2, true)
        @Expect(a1 <= a2, true)
        @Expect(a1 <= a1_1, true)
        @Expect(a2 < a1, false)
        @Expect(a2 > a1, true)
        @Expect(a2 >= a1, true)
        @Expect(a1_1 >= a1, true)
        @Expect(a1 > a2, false)
    }
}

class A <: Comparable<A> {
    A(let x: Int64) {}

    public func compare(that: A): Ordering {
        this.x.compare(that.x)
    }
}
