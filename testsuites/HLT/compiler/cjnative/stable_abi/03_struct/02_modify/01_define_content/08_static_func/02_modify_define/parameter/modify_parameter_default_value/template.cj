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
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    public static func geta(a: Float64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static func getb(a: Float64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static func getc(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    @Frozen
    public static func getd(b!: Int64 = 2, c!: Int64 = 2): Int64 {
        return getc(0, b: b, c: c)
    }

    public static const func getf(b!: Int64, c!: Int64 = 1) {
        return 0
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(Rectangle.geta(1.2, b:1, c:1), 2)
    assert(Rectangle.getb(1.2, b:1, c:1), 2)
    assert(Rectangle.getc(1, b:1, c:1), 2)
    return 0
}