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
    public func getWidth(): Int64{
        return width
    }
}

public interface I {}
public interface Addable <: I {}
public open class Subtractable <: Addable {const init() {}}
public struct Multiplicable <: Addable {const init() {}}

public struct S1 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

struct S2 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S33 {
    @Frozen
    public static func f() {
        let s3 = S3()
    }
}

struct S4 {
    const init() {}
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public struct S44 {
    const init() {}
    public const static func f() {
        let s4 = S4()
    }
}

struct S5 {
    public static let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public static let a3 : Addable = Subtractable()
    public static let a4 : Addable = Subtractable()
    
    public static func f1() {
        return a1
    }
    
    const static func f2() {
        return a2
    }
    public const static func f22() {
        return f2()
    }
    
    static func f3() {
        return a3
    }
    @Frozen
    public static func f33() {
        return f3()
    }
    
    static func f4() {
        return a4
    }
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(S1.f1() is Addable, true)
    assert(S1.f2() is Addable, true)
    assert(S1.f3() is Addable, true)
    assert(S1.f4() is Addable, true)

    assert(S2.f1() is Addable, true)
    assert(S2.f2() is Addable, true)
    assert(S2.f3() is Addable, true)
    assert(S2.f4() is Addable, true)

    assert(S3.f1() is Addable, true)
    assert(S3.f2() is Addable, true)
    assert(S3.f3() is Addable, true)
    assert(S3.f4() is Addable, true)

    assert(S4.f1() is Addable, true)
    assert(S4.f2() is Addable, true)
    assert(S4.f3() is Addable, true)
    assert(S4.f4() is Addable, true)

    assert(S5.f1() is Addable, true)
    assert(S5.f2() is Addable, true)
    assert(S5.f3() is Addable, true)
    assert(S5.f4() is Addable, true)
    return 0
}