/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi


public interface I {
    func f(): Int64
}

public interface Addable <: I {
    func add(other: Int64): Int64
}

public open class Subtractable <: Addable {

    public open func add(other: Int64): Int64 {
        return 0
    }

    public open func sub(other: Int64): Int64 {
        return 0
    }

    public open func f(): Int64 {
        return 0
    }

    const init() {}
}

public struct Multiplicable <: Addable {

    public func add(other: Int64): Int64 {
        return 0
    }

    public func sub(other: Int64): Int64 {
        return 0
    }

    public func mul(other: Int64): Int64 {
        return 0
    }

    public func f(): Int64 {
        return 0
    }
    
    const init() {}
}

struct S1 {
    const init() {}
    public static let a1 : Addable = Subtractable()

    static const a2 : Addable = Subtractable()
    public static const func f2(){
        a2
    }
    
    static let a3 : Addable = Subtractable()
    @Frozen
    public static func f3(){
        a3
    }
    
    static let a4 : Addable = Subtractable()

    public static let a5 : Addable = Multiplicable()

    static const a6 : Addable = Multiplicable()
    public static const func f6(){
        a6
    }
    
    static let a7 : Addable = Multiplicable()
    @Frozen
    public static func f7(){
        a7
    }
    
    static let a8 : Addable = Multiplicable()

    static let width = 10
    public func getWidth(): Int64{
        return width
    }
}

public struct S {
    public const init() {}
    public const func f1(){
        let s1 = S1()
    }
    static let heigh = 20
    public func getHeigh(): Int64{
        return heigh
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    let s1 = S1()
    assert(S1.a1 is Addable, true)
    assert(S1.a2 is Addable, true)
    assert(S1.a3 is Addable, true)
    assert(S1.a4 is Addable, true)
    assert(S1.a5 is Addable, true)
    assert(S1.a6 is Addable, true)
    assert(S1.a7 is Addable, true)
    assert(S1.a8 is Addable, true)
}