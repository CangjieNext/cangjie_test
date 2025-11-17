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
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

struct S2 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

public struct S33 {
    @Frozen
    public func f() {
        let s3 = S3()
    }
}

struct S4 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

public struct S44 {
    const init() {}
    public const func f() {
        let s4 = S4()
    }
}

struct S5 {
    const init() {}
    public let a1 : Addable = Subtractable()
    public static const a2 : Addable = Subtractable()
    public let a3 : Addable = Subtractable()
    public let a4 : Addable = Subtractable()
    
    public func f1() {
        return a1
    }
    
    const func f2() {
        return a2
    }
    public const func f22() {
        return f2()
    }
    
    func f3() {
        return a3
    }
    @Frozen
    public func f33() {
        return f3()
    }
    
    func f4() {
        return a4
    }
}

