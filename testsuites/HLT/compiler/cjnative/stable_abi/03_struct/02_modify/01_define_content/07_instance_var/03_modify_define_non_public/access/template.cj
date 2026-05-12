/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    public let a1 = 20
    let a2 = 20
    protected let a3 = 20
    private let a4 = 20
    internal let a5 = 20
    let a6 = 20
    let a7 = 20 
    let a8 = 20
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    var a = Rectangle()
    assert(a.a2, 20)
    assert(a.a3, 20)
    assert(a.a5, 20)
    assert(a.a6, 20)
    assert(a.a7, 20)
    assert(a.a8, 20)
    return 0
}
