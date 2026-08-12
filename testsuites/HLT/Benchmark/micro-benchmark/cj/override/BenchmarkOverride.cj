/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import std.collection.*

interface I1 {
    func test_i1(): Unit {

    }
}


interface I2 {
    func test_i2(): Unit {

    }
}

interface I3 {
    func test_i3(): Unit {

    }
}

interface I4 {
    func test_i4(): Unit {

    }
}

interface I5 {
    func test_i5(): Unit {

    }
}

interface I6<T1> {
    func test_i6(): Unit {

    }
}

interface I7<T1> {
    func test_i7(): Unit {

    }
}

interface I8<T1> {
    func test_i8(): Unit {

    }
}

interface I9<T1> {
    func test_i9(): Unit {

    }
}

interface I10<T1> {
    func test_i10(): Unit {

    }
}

open class A1 {
    public open func test_1(){

    }
}

open class A2 <: A1 {
    public open func test_1(){

    }
}

open class A3 <: A2 {
    public open func test_1(){

    }
}

open class A4 <: A3 {
    public open func test_1(){

    }
}

open class A5 <: A4 {
    public open func test_1(){

    }
}

open class A6 <: A5 {
    public open func test_1(){

    }
}

open class A7 <: A6 {
    public open func test_1(){

    }
}

open class A8 <: A7 {
    public open func test_1(){

    }
}

open class A9 <: A8 {
    public open func test_1(){

    }
}

open class B1 {
    public open func test_1(){

    }
}

open class B2 <: B1 {
    public open func test_2(){

    }
}

open class B3 <: B2 {
    public open func test_3(){

    }
}

open class B4 <: B3 {
    public open func test_4(){

    }
}

open class B5 <: B4 {
    public open func test_5(){

    }
}

open class B6 <: B5 {
    public open func test_6(){

    }
}

open class B7 <: B6 {
    public open func test_7(){

    }
}

open class B8 <: B7 {
    public open func test_8(){

    }
}

open class B9 <: B8 {
    public open func test_9(){

    }
}

open class B10 <: B9 {
    public open func test_10(){

    }
}

class A10 <: A9 & I1 & I2 & I3 & I4 & I5 {
    public func test_1(){

    }

    public func test_i1(){

    }

    public func test_i2(){

    }

    public func test_i3(){

    }

    public func test_i4(){

    }

    public func test_i5(){

    }
}

class A11 <: I1 & I2 & I3 & I4 & I5 {
    public func test_i1(){

    }

    public func test_i2(){

    }

    public func test_i3(){

    }

    public func test_i4(){

    }

    public func test_i5(){

    }
}

class C<T1, T2> <: B10 & I1 & I2 & I3 & I4 & I5{

}

extend<T1, T2> C<T1, T2> <: I6<T1>  where T1 <: B9{

}


extend<T1, T2> C<T1, T2> <: I7<T1>  where T1 <: B9, T2 <: I1{
    
}

extend<T1, T2> C<T1, T2> <: I8<T1>  where T1 <: B8, T2 <: I2{
    
}

extend<T1, T2> C<T1, T2> <: I9<T1>  where T1 <: B7, T2 <: I3{
    
}

extend<T1, T2> C<T1, T2> <: I10<T1>  where T1 <: B6, T2 <: I4{
    
}


func vtable_call_test_I1(v: I1) {
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
    v.test_i1()
}

func vtable_call_test_I2(v: I2) {
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
    v.test_i2()
}

func vtable_call_test_I3(v: I3) {
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
    v.test_i3()
}

func vtable_call_test_I4(v: I4) {
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
    v.test_i4()
}

func vtable_call_test_I5(v: I5) {
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
    v.test_i5()
}

func vtable_call_test_A1(v: A1) {
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
    v.test_1()
}


@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class Test_Forin_Range {

    @BeforeEach
    public func GenerateExtend(): Unit {
        C<Int64, Bool>()
        C<B2, Bool>()
        C<B9, I2>()
        C<B8, I2>()
        C<B7, I3>()
        C<B6, I4>()
    }

    // 虚函数调用
    @Bench
    func BenchmarkOverride(): Unit {
        vtable_call_test_A1(A1())
        vtable_call_test_A1(A2())
        vtable_call_test_A1(A3())
        vtable_call_test_A1(A4())
        vtable_call_test_A1(A5())
        vtable_call_test_A1(A6())
        vtable_call_test_A1(A7())
        vtable_call_test_A1(A8())
        vtable_call_test_A1(A9())
        vtable_call_test_A1(A10())
    }

    // 顺序调用interface函数
    @Bench
    func BenchmarkOverride_I_Order(): Unit {
        vtable_call_test_I1(A10())
        vtable_call_test_I1(A11())
        vtable_call_test_I2(A10())
        vtable_call_test_I2(A11())
        vtable_call_test_I3(A10())
        vtable_call_test_I3(A11())
        vtable_call_test_I4(A10())
        vtable_call_test_I4(A11())
        vtable_call_test_I5(A10())
    }

    // 倒序调用interface函数
    @Bench
    func BenchmarkOverride_I_Reverse(): Unit {
        vtable_call_test_I5(A10())
        vtable_call_test_I5(A11())
        vtable_call_test_I4(A10())
        vtable_call_test_I4(A11())
        vtable_call_test_I3(A10())
        vtable_call_test_I3(A11())
        vtable_call_test_I2(A10())
        vtable_call_test_I2(A11())
        vtable_call_test_I1(A10())
        vtable_call_test_I1(A11())
    }

    // 乱序调用interface函数
    @Bench
    func BenchmarkOverride_I_OutofOrder(): Unit {
        vtable_call_test_I4(A10())
        vtable_call_test_I4(A11())
        vtable_call_test_I2(A10())
        vtable_call_test_I2(A11())
        vtable_call_test_I1(A10())
        vtable_call_test_I1(A11())
        vtable_call_test_I5(A10())
        vtable_call_test_I5(A11())
        vtable_call_test_I3(A10())
        vtable_call_test_I3(A11())
    }

}