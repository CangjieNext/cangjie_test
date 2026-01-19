/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi


open class Base {}
public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

interface Multiplicable {
    func mul(other: Int64): Int64
}

public struct MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}


struct MyInt1 <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }
}

struct S2 <: Addable & Subtractable  {
    var value = 0

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt2 <: Addable & Subtractable {
    let x = S2();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

    public func getX(): Int64 {
        return x.value
    }

}

struct S3 <: Addable & Subtractable  {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt3 <: Addable & Subtractable {
    let x = S3();
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }


    public const func getX(): Int64 {
        return x.value
    }

}

struct S4 <: Addable & Subtractable  {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt4 <: Addable & Subtractable {
    let x = S4();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    
    public func sub(other: Int64): Int64 {
        value - other
    }

    @Frozen
    public func getX(): Int64 {
        return x.value
    }

}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    var s1 = MyInt()
    var s2 = MyInt1()
    var s3 = S2()
    var s4 = S3()
    var s5 = S4()

    assert(s1.add(1), 1)
    assert(s1.sub(0), 0)

    assert(s2.add(1), 1)
    assert(s2.sub(0), 0)
    
    assert(s3.add(1), 1)
    assert(s3.sub(0), 0)

    assert(s4.add(1), 1)
    assert(s4.sub(0), 0)

    assert(s5.add(1), 1)
    assert(s5.sub(0), 0)
    return 0
}