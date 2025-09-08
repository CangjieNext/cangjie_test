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
 
/**
 * Test description: Test the math extension
 */
 
@Test
class FuncTest {
 
    @TestCase
    func testInt16MaxMin(): Unit {
        @Expect(Int16.getMax(), Int16.Max)
        @Expect(Int16.getMin(), Int16.Min)      
    }
 
    @TestCase
    func testInt32MaxMin(): Unit {
        @Expect(Int32.getMax(), Int32.Max)
        @Expect(Int32.getMin(), Int32.Min)      
    }
 
    @TestCase
    func testInt64MaxMin(): Unit {
        @Expect(Int64.getMax(), Int64.Max)
        @Expect(Int64.getMin(), Int64.Min)      
    }
 
    @TestCase
    func testIntNativeMaxMin(): Unit {
        @Expect(IntNative.getMax(), IntNative.Max)
        @Expect(IntNative.getMin(), IntNative.Min)      
    }
 
    @TestCase
    func testUInt8MaxMin(): Unit {
        @Expect(UInt8.getMax(), UInt8.Max)
        @Expect(UInt8.getMin(), UInt8.Min)      
    }
 
    @TestCase
    func testUInt16MaxMin(): Unit {
        @Expect(UInt16.getMax(), UInt16.Max)
        @Expect(UInt16.getMin(), UInt16.Min)      
    }
 
    @TestCase
    func testUInt32MaxMin(): Unit {
        @Expect(UInt32.getMax(), UInt32.Max)
        @Expect(UInt32.getMin(), UInt32.Min)      
    }
 
    @TestCase
    func testUInt64MaxMin(): Unit {
        @Expect(UInt64.getMax(), UInt64.Max)
        @Expect(UInt64.getMin(), UInt64.Min)      
    }
 
    @TestCase
    func testUIntNativeMaxMin(): Unit {
        @Expect(UIntNative.getMax(), UIntNative.Max)
        @Expect(UIntNative.getMin(), UIntNative.Min)      
    }
 
    @TestCase
    func testFloat16MaxMin(): Unit {
        @Expect(Float16.getMax(), Float16.Max)
        @Expect(Float16.getMin(), Float16.Min)      
    }
 
    @TestCase
    func testFloat32MaxMin(): Unit {
        @Expect(Float32.getMax(), Float32.Max)
        @Expect(Float32.getMin(), Float32.Min)      
    }
 
    @TestCase
    func testFloat64MaxMin(): Unit {
        @Expect(Float64.getMax(), Float64.Max)
        @Expect(Float64.getMin(), Float64.Min)      
    }
 
    @TestCase
    func testgetNaN(): Unit {
        @Expect(Float32.getNaN().isNaN(), true)
        @Expect(Float64.getNaN().isNaN(), true)      
    }
 
    @TestCase
    func testgetInf(): Unit {
        @Expect(Float32.getInf(), Float32.Inf)
        @Expect(Float64.getInf(), Float64.Inf)      
    }
 
    @TestCase
    func testgetMinDenormal(): Unit {
        @Expect(Float32.getMinDenormal(), Float32.MinDenormal)
        @Expect(Float64.getMinDenormal(), Float64.MinDenormal)      
    }
 
    @TestCase
    func testgetMinNormal(): Unit {
        @Expect(Float32.getMinNormal(), Float32.MinNormal)
        @Expect(Float64.getMinNormal(), Float64.MinNormal)      
    }
    
}