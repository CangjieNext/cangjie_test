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
    
    public let a1 = 20
}

public struct Rectangle2 {
    const init() {}    
    public let a2 = 20
}

public struct Rectangle3 {
    @Frozen
    init() {}
    
    public let a3 = 20
}


public open class A {const init() {}}
public class B <: A {const init() {}}
public class C {const init() {}}
public struct S1{
    public let a:A = B()
    public let b = 1
}

struct S2{
    public let a:A = B()
    public let b = 1
}

public struct S22 {
    var s2 = S2()
}

struct S3{
    public let a:A = B()
    public let b = 1
}

public struct S33 {
    @Frozen
    public func f3(){
        let s3 = S3()
    }
}

struct S4{
    const init() {}
    public let a:A = B()
    public let b = 1
}

public struct S44 {
    public const init() {}
    public const func f4(){
        let s4 = S4()
    }
}

struct S5{
    public let a:A = B()
    public let b = 1
}

