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
    public static let a1 = 20
    static let a2 = 20
    public static const a3 = 20
    static const a4 = 20
}


public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func f(){
    assert(Rectangle.a1, 20)
    assert(Rectangle.a2, 20)
    assert(Rectangle.a3, 20)
    assert(Rectangle.a4, 20)
    return 0
}