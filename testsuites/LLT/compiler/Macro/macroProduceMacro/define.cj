// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package define

import std.ast.*

public macro InnerM(input: Tokens) {
    println("InnerM")
    return input
}

public macro InnerM2(input: Tokens) {
    println("InnerM2")
    return quote(var a = 1)
}

// struct
public macro M1(input: Tokens) {
    println("M1")
    return quote(@InnerM 
        struct A {
            var a = 1
        }
    )
}

// func
public macro M2(input: Tokens) {
    println("M2")
    return quote(
        @InnerM
        func foo () {
            var a = 1
            a
        }
    )
}

// interface
public macro M3(input: Tokens) {
    println("M3")
    return quote(
        @InnerM(interface I {})
    )
}

// enum
public macro M4(input: Tokens) {
    println("M4")
    return quote(
        @InnerM
        enum T {
            | A | B | C | ...
        }
    )
}

// varDecl
public macro M5(input: Tokens) {
    println("M5")
    return quote(
        @InnerM
        var a = 1
    )
}

// extend
public macro M6(input: Tokens) {
    println("M6")
    return quote(
        @InnerM
        extend String {
            public func printSize() {}
        }
    )
}

// var in struct
public macro M7(input: Tokens) {
    println("M7")
    return quote(
        struct A {
            var t = 0
            @InnerM
            var a = 1
        }
    )
}

// 2 top level struct
public macro M8(input: Tokens) {
    println("M8")
    return quote(
        struct A {
            var t = 0
        }
        @InnerM
        struct B {
            var t = 0
        }
    )
}

// class func param
public macro M9(input: Tokens) {
    println("M9")
    return quote(
        @InnerM
        class A {
            var a = 0

            public A(@InnerM a: Int64){
                this.a = a
            }
        }
    )
}

// func param
public macro M10(input: Tokens) {
    println("M10")
    return quote(
        struct A {
            func foo(@InnerM a: Int64){
                a
            }
        }
    )
}

// PrimaryFuncParam
public macro M11(input: Tokens) {
    println("M11")
    return quote(
        @InnerM
        a: Int64
    )
}

// prop
public macro M12(input: Tokens) {
    println("M12")
    return quote(
        @InnerM
        public prop i: Int64 {
            get() { 0 }
        }
    )
}

// hasParenthesis
public macro M13(input: Tokens) {
    println("M13")
    return quote(
        @InnerM2(let class 1)
    )
}

public macro M14(input: Tokens) {
    println("M14")
    return quote(
        @InnerM
        $input
    )
}