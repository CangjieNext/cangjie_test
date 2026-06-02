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
class HashableTest {
    /*
     * Test description: Test Hashable ::core
     * Test API:
     * extend Unit <: Hashable
     * extend Bool <: Hashable
     * extend Rune <: Hashable
     * extend IntNative <: Hashable
     * extend Int64 <: Hashable
     * extend Int32 <: Hashable
     * extend Int16 <: Hashable
     * extend Int8 <: Hashable
     * extend UIntNative <: Hashable
     * extend UInt64 <: Hashable
     * extend UInt32 <: Hashable
     * extend UInt16 <: Hashable
     * extend UInt8 <: Hashable
     * extend Float64 <: Hashable
     * extend Float32 <: Hashable
     * extend Float16 <: Hashable
     */
    @TestCase
    func testHashCode(): Unit {
        //test Ordering
        let gt = Ordering.GT
        let lt = Ordering.LT
        let eq = Ordering.EQ
        @Expect(gt.hashCode(),3)
        @Expect(lt.hashCode(),1)
        @Expect(eq.hashCode(),2)

        //test hashCode
        var b1 = true
        var b2 = false
        var c = r'c'
        var num1: IntNative = IntNative.Max
        var num2: Int64 = 99
        var num3: Int32 = Int32.Max
        var num4: Int16 = Int16.Max
        var num5: Int8 = Int8.Max
        var num6: UIntNative = UIntNative.Max
        var num7: UInt64 = UInt64.Max
        var num8: UInt32 = UInt32.Max
        var num9: UInt16 = UInt16.Max
        var num10: UInt8 = UInt8.Max
        var float1: Float64 = 0.0f64
        var float2: Float64 = -0.0f64
        var float3: Float32 = 3.14e3
        var float4: Float16 = 3.14e2
        var rg1 = 0..10
        var rg2 = 0..10 : 1
        @Expect(b1.hashCode(),1)
        @Expect(b2.hashCode(),0)

        @Expect(c.hashCode(),99)
        @Expect(num1.hashCode(),Int64(num1))
        @Expect(num2.hashCode(),Int64(num2))
        @Expect(num3.hashCode(),Int64(num3))
        @Expect(num4.hashCode(),Int64(num4))
        @Expect(num5.hashCode(),Int64(num5))
        @Expect(num6.hashCode(),-1)
        @Expect(num7.hashCode(),-1)
        @Expect(num8.hashCode(),Int64(num8))
        @Expect(num9.hashCode(),Int64(num9))
        @Expect(num10.hashCode(),Int64(num10))

        @Expect(rg1.hashCode(),rg2.hashCode())

        @Expect(float1.hashCode(),float2.hashCode())
        float3.hashCode()
        float4.hashCode()

        //test DefaultHasher 
        var dfh: DefaultHasher = DefaultHasher()
        var str = "abc"
        dfh.write(b1)
        dfh.write(c)
        dfh.write(num2)
        dfh.write(num3)
        dfh.write(num4)
        dfh.write(num5)
        dfh.write(num7)
        dfh.write(num8)
        dfh.write(num9)
        dfh.write(num10)
        dfh.write(float1)
        dfh.write(float2)
        dfh.write(float3)
        dfh.write(str)
        dfh.reset()
        @Expect(dfh.finish(),0)
        @Expect(().hashCode(),0)
    }

    /*
     * Test description: Test Hashable ::core
     * Test API:
     * public func hashCode(): Int64
     */
    @TestCase
    func testHashCodeOption(): Unit {
        //Int64
        let i64 = 256
        let hash64 = i64.hashCode()
        @Expect(hash64, Some(i64).hashCode())

        //Int32
        let i32 = Int32(256)
        let hash32 = i32.hashCode()
        @Expect(hash32, Some(i32).hashCode())

        //Int16
        let i16 = Int16(256)
        let hash16 = i16.hashCode()
        @Expect(hash16, Some(i16).hashCode())

        //Int8
        let i8 = Int8(127)
        let hash8 = i8.hashCode()
        @Expect(hash8, Some(i8).hashCode())
        //IntNative
        let intNative = IntNative(256)
        let hashIntNative = intNative.hashCode()
        @Expect(hashIntNative, Some(intNative).hashCode())

        //UInt64
        let uInt64 = UInt64(256)
        let hashu64 = uInt64.hashCode()
        @Expect(hashu64, Some(uInt64).hashCode())

        //UInt32
        let uInt32 = UInt32(256)
        let hashu32 = uInt32.hashCode()
        @Expect(hashu32, Some(uInt32).hashCode())

        //UInt16
        let uInt16 = UInt16(256)
        let hashu16 = uInt16.hashCode()
        @Expect(hashu16, Some(uInt16).hashCode())

        //UInt8
        let uInt8 = UInt8(128)
        let hashu8 = uInt8.hashCode()
        @Expect(hashu8, Some(uInt8).hashCode())
        //IntNative
        let uIntNative = UIntNative(256)
        let hashuIntNative = uIntNative.hashCode()
        @Expect(hashuIntNative, Some(uIntNative).hashCode())

        //Float64
        let f64 = Float64(3.14159)
        let hashF64 = f64.hashCode()
        @Expect(hashF64, Some(f64).hashCode())

        //Float32
        let f32 = Float32(3.14159)
        let hashF32 = f32.hashCode()
        @Expect(hashF32, Some(f32).hashCode())

        //Float16
        let f16 = Float16(3.14159)
        let hashF16 = f16.hashCode()
        @Expect(hashF16, Some(f16).hashCode())
        //String
        let str = "hello cangjie"
        let hashStr = str.hashCode()
        @Expect(hashStr, Some(str).hashCode())

        //Rune
        let chr = r'c'
        let hashChr = chr.hashCode()
        @Expect(hashChr, Some(chr).hashCode())

        //Bool
        let boolTrue = true
        let hashBool = boolTrue.hashCode()
        @Expect(hashBool, Some(boolTrue).hashCode())
        //None
        let null = Option<String>.None
        let hashNull = null.hashCode()
        @Expect(hashNull, Some(null).hashCode())
        // range 
        @Expect(Range<Int64>(1,3,1,true,true, true).hashCode()!=Range<Int8>(1,4,2,true,true, true).hashCode())
        @Expect(Range<Int64>(1,5,1,true,true, true).hashCode()!=Range<Int64>(1,6,2,true,true, true).hashCode())
    }

    @TestCase
    func test_same_hash_code(): Unit {
        let str1 = "/home/user/work/framework/test_temp/run/incremental_02_info_ae428ae2fd3611ee8d3a44004de08e12/incremental_02/jar_package/pkg1.jar1713446760/home/user/work/wuyan/framework/test_temp/run/incremental_02_info_ae428ae2fd3611ee8d3a44004de08e12/incremental_02/target/release/jmodule1/pkg1.cjo1713445363"
        let str2 = "/home/user/work/framework/test_temp/run/incremental_02_info_ae428ae2fd3611ee8d3a44004de08e12/incremental_02/jar_package/pkg1.jar9713446761/home/user/work/wuyan/framework/test_temp/run/incremental_02_info_ae428ae2fd3611ee8d3a44004de08e12/incremental_02/target/release/jmodule1/pkg1.cjo1713445363"

        @Expect(str1.hashCode() != str2.hashCode())
    }
}
