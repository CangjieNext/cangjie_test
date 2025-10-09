/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: instance property
open class U1 { }
class U2 <: U1 { }
public struct TestStruct {
    public var a: Int64 = 0
}

extend TestStruct{
    public prop prop_public: U1{
        get(){
            U1()
        }
    }
    prop prop_frozen: U1{
        get(){
            U1()
        }
    }
    prop prop_nonpublic:U1{
        get(){
            U1()
        }
    }

}

@Frozen
public func foo_1(){
    let x = TestStruct().prop_frozen
}

public struct TestStruct_unexport<T> {
    public var a: Int64 = 0
}
private interface I1 {}
extend<T> TestStruct_unexport<T> where T <: I1 {
    public prop prop_:U1{
        get(){
            U1()
        }
    }
}



