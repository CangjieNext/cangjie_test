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
    static let width = 10

    public func getWidth(): Int64{
        return width
    }

    public static func geta1() {
        return 1
    }

    static func geta2() {
        return 2
    }

    public static func geta3() {
        return 3
    }

    private static func geta4() {
        return 4
    }

    internal static func geta5() {
        return 5
    }

    static func geta6() {
        return 6
    }

    protected static func geta7() {
        return 7
    }

    public static func geta8() {
        return 8
    }

    static func geta9() {
        return 9
    }

    static func geta10() {
        return 10
    }

    unsafe public static func geta11() {
        return 11
    }

    static const func geta12() {
        return 12
    }

    @Frozen
    public static func geta13() {
        let x = geta12()
        return x
    }

    public static const func geta14() {
        return 14
    }

    @Frozen
    public func geta15() {
        let y = geta10()
        return y
    }

    static const func geta16() {
        return 16
    }

    public static const func geta17() {
        const z = geta16()
        return z
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    let a = Rectangle()
    assert(Rectangle.geta5(), 5)
    assert(Rectangle.geta6(), 6)
    assert(Rectangle.geta7(), 7)
    assert(Rectangle.geta9(), 9)
    assert(Rectangle.geta10(), 10)
    assert(Rectangle.geta12(), 12)
    assert(Rectangle.geta16(), 16)
    return 0
}