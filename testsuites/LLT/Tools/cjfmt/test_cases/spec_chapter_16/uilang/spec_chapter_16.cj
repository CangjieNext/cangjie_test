// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 16.1 const 变量
main(): Int64 {
    let b: Int64 = a // ok
    print(a) // ok
    let c: VArray<Int64, $0> = [] // ok
    return 0
}

// const 变量可以访问对应类型的所有实例成员，也可以调用对应类型的所有非 mut 实例成员函数。
struct Foo {
    let a = 0
    var b = 0

    const init() {}

    func f1() {}

    const func f2() {}

    mut func f3() {
        b = 123
    }
}

main(): Int64 {
    const v = Foo()
    print(v.a) // ok
    print(v.b) // ok
    v.f1() // ok
    v.f2() // ok
    v.f3() // error, f3 is mut function
    return 0
}

// 16.4 const 函数
const func f(a: Int64): Int64 { // ok
    let b = 6
    if (a > 5 && (b + a) < 15 ) {
        return a * a
    }
    return a
}

class A {
    var a = 0
}

const func f1(a: A): Unit { // ok
    return
}

// 16.4.1 接口中的 const 函数
interface I {
    const func f(): Int64
    const static func f2(): Int64
}

const func g<T>(i: T) where T <: I {
    return i.f() + T.f2()
}

// 16.5 const init
struct R1 {
    var a: Int64
    let b: Int64
    const init() { // ok
        a = 0
        b = 0
    }
}

struct R2 {
    var a = 0
    let b = 0
    const init() {} // ok
}

func zero(): Int64 {
    return 0
}

struct R3 {
    let a = zero()
    const init() {} // error，Initialization of a is not const expression
}

class C1 {
    var a = 0
    const init() {} // error，a can not be var binding
}

struct R4 {
    var a = C1()
    const init() {} // error，Initialization of a is not const expression
}

open class C2 {
    let a = 0
    let b = R2()
    const init() {} // ok
}

class C3 <: C2 {
    let c = 0
    const init() {} // ok
}

// 第十七章 注解
@Annotation1[arg1, arg2]
@Annotation2
class Foo {}

// @Annotation
public class CustomAnnotation {
    let name: String
    let version: Int64
    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

// use annotation
@CustomAnnotation["Sample", version: 1]
class Foo {}

@Annotation
public class MyAnnotation {}

@MyAnnotation // ok
class Foo {}

@MyAnnotation
@MyAnnotation // error
class Foo {}

@MyAnnotation
@MyAnnotation2
class Bar {}

@BaseAnno
open class Base {}

@InterfaceAnno
interface I {}

@SubAnno
class Sub <: Base & I {} // Sub has only SubAnno annotation information.

public enum AnnotaitionKind {
| Type
| Parameter
| Init
| MemberProperty
| MemberFunction
| MemberVariable
}

@Annotation[target: [Type, MemberFunction]]
class CustomAnnotation{}

@Annotation
class SubCustomAnnotation{}

@Annotation[target: []]
class MyAnno{}
