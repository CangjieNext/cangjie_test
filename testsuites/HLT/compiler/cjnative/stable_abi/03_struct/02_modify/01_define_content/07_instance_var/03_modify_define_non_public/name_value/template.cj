/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle1 {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
    
    let a1 = 20
    internal let a2 = 30
    protected let a3 = 40
    private let a4 = 50
}

public struct Rectangle2 {
    const init() {}    
    let a1 = 20
    internal let a2 = 30
    protected let a3 = 40
    private let a4 = 50
}

public struct Rectangle3 {
    @Frozen
    init() {}
    
    let a1 = 20
    internal let a2 = 30
    protected let a3 = 40
    private let a4 = 50
}


public open class A {const init() {}}
public class B <: A {const init() {}}
public class C {const init() {}}
public struct S1{
    let a:A = B()
    internal let b:A = B()
    protected let c:A = B()
    private let d:A = B()
}

struct S2{
    let a:A = B()
    internal let b:A = B()
    protected let c:A = B()
    private let d:A = B()
}

public struct S22 {
    var s2 = S2()
}

struct S3{
    let a:A = B()
    internal let b:A = B()
    protected let c:A = B()
    private let d:A = B()
}

public struct S33 {
    @Frozen
    public func f3(){
        let s3 = S3()
    }
}

struct S4{
    const init() {}
    let a:A = B()
    internal let b:A = B()
    protected let c:A = B()
    private let d:A = B()
}

public struct S44 {
    public const init() {}
    public const func f4(){
        let s4 = S4()
    }
}

struct S5{
    let a:A = B()
    internal let b:A = B()
    protected let c:A = B()
    private let d:A = B()
}

public func assert<T>(expected:T, actual:T) : Unit where T <: Equatable<T> & ToString{
    if(expected == actual){
    }else{
        throw Exception("${expected} != ${actual}")
    }
}

public func check(){
    assert(Rectangle1().a1, 20)
    assert(Rectangle1().a2, 30)
    assert(Rectangle1().a3, 40)
    return 0
}