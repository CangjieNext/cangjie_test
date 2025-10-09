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
open public class Father {
    public const init(){}
}
public class Son <: Father {
    public const init(){}
}

public struct TestStruct {}
extend TestStruct{
    public static func f1() {
        0
    }
    public static func foo_public(a: Son, b!: Son, c!: Int64 = 1){
    }

    static const func foo_const(a: Son, b!: Son, c!: Int64 = 1){
    }

    static func foo_frozen(a: Son, b!: Son, c!: Int64 = 1){
    }

    static func foo_nonpublic(a: Son, b!: Son, c!: Int64 = 1){
    }
}
public const func foo1(){
    TestStruct.foo_const(Son(),b:Son())
}

@Frozen 
public func foo2(){
    TestStruct.foo_frozen(Son(),b:Son())
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public static func foo_unexport(a: Son, b!: Son, c!: Int64 = 1){
    }
}

