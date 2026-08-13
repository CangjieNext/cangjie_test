// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// test extend: instance function; B is a subtype of A, but not necessarily class or interface types.
interface Addable {
    func add(other: Int64): Int64
}
struct MyInt <: Addable {
    var value = 0
    public const init(){}
    public func add(other: Int64): Int64 {
        value + other
    }
}

public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    const func foo_const_sub_notclass_or_interface():MyInt {
        MyInt()
    }

    const func foo_const_notsub():Int64 {
        1
    }

}
public const func foo_1(){
    let x2 = TestStruct().foo_const_sub_notclass_or_interface()
    let x3 = TestStruct().foo_const_notsub()
}
