/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: static function
public struct TestStruct {}
extend TestStruct{
    public static func f1() {
        0
    }
    public static func foo_public(a: Int64, b: Int64, c!: Int64 = 1){
        a+b+c
    }

    static const func foo_const(a: Int64, b: Int64, c!: Int64 = 1){
        a+b+c
    }

    static func foo_frozen(a: Int64, b: Int64, c!: Int64 = 1){
        a+b+c
    }

    static func foo_nonpublic(a: Int64, b: Int64, c!: Int64 = 1){
        a+b+c
    }
}
public const func foo1(){
    TestStruct.foo_const(1,2)
}

@Frozen 
public func foo2(){
    TestStruct.foo_frozen(1,2)
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public static func foo_unexport(a: Int64, b: Int64, c!: Int64 = 1){
        a+b+c
    }
}
public func global_func_01(){
    TestStruct.foo_nonpublic(1, 2) == 4
    TestStruct_unexport<I1>.foo_unexport(1, 2) == 4
}