/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: instance function
public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    public func foo_public(a: Int64, b: Int64, c!:Int64, d!:Int64 = 1) {
        a + b + c + d
    }
    const func foo_const(a: Int64, b: Int64, c!:Int64, d!:Int64 = 1){
        a + b + c + d
    }
    func foo_frozen(a: Int64, b: Int64, c!:Int64, d!:Int64 = 1){
        a + b + c + d
    }
    func foo_nonpublic(a: Int64, b: Int64, c!:Int64, d!:Int64 = 1){
        a + b + d + c
    }

}
public const func foo_1(){
    let x = TestStruct().foo_const(1,1,c:1)
}
@Frozen
public func foo_2(){
    let x = TestStruct().foo_frozen(1,1,c:1)
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public func foo_unexport(a: Int64, b: Int64, c!:Int64, d!:Int64 = 1){
        a + b + c + d
    }
}

