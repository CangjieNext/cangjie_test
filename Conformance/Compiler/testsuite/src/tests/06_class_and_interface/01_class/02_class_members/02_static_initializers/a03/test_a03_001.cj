
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a03_001

  @Level:         1

  @Assertion:   6.1.2.2(3)
                The syntax of the static initializer is as follows.
                staticInit
                    : 'static' 'init' '(' ')'
                    '{'
                    expressionOrDeclarations?
                    '}'
                    ;
  @Description: Checks compilation and execution of a program that uses static initializers.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6136

*/

class C1 {
    // Declaration
    static init() { var x : Int64 }
}

class C2 {
    // Declaration
    static init() { func f() { 1 } }
}

class C3 {
    // Empty
    static init() { }
}

class C4 {
    // Expression
    static init() { print(1) }
}

class C5 {
    static init() {
        // Multiple declarations
        var x : Int64
        var y : UInt64
        func f() { 1 }
    }
}

class C6 {
    static init() {
        // Multiple expressions
        print(1)
        print(2)
        print(3)
    }
}

class C7 {
    static init() {
        // Declarations and expressions
        var x : Int64
        print(1)
        print(2)
        var y : UInt64
        func f() { 1 }
        print(3)
    }
}

class G1<T> {
    // Declaration
    static init() { var x : Int64 }
}

class G2<T> {
    // Declaration
    static init() { func f() { 1 } }
}

class G3<T> {
    // Empty
    static init() { }
}

class G4<T> {
    // Expression
    static init() { print(1) }
}

class G5<T> {
    static init() {
        // Multiple declarations
        var x : Int64
        var y : UInt64
        func f() { 1 }
    }
}

class G6<T> {
    static init() {
        // Multiple expressions
        print(1)
        print(2)
        print(3)
    }
}

class G7<T> {
    static init() {
        // Declarations and expressions
        var x : Int64
        print(1)
        print(2)
        var y : UInt64
        func f() { 1 }
        print(3)
    }
}

struct S1 {
    // Declaration
    static init() { var x : Int64 }
}

struct S2 {
    // Declaration
    static init() { func f() { 1 } }
}

struct S3 {
    // Empty
    static init() { }
}

struct S4 {
    // Expression
    static init() { print(1) }
}

struct S5 {
    static init() {
        // Multiple declarations
        var x : Int64
        var y : UInt64
        func f() { 1 }
    }
}

struct S6 {
    static init() {
        // Multiple expressions
        print(1)
        print(2)
        print(3)
    }
}

struct S7 {
    static init() {
        // Declarations and expressions
        var x : Int64
        print(1)
        print(2)
        var y : UInt64
        func f() { 1 }
        print(3)
    }
}

abstract class A1 {
    // Declaration
    static init() { var x : Int64 }
}

abstract class A2 {
    // Declaration
    static init() { func f() { 1 } }
}

abstract class A3 {
    // Empty
    static init() { }
}

abstract class A4 {
    // Expression
    static init() { print(1) }
}

abstract class A5 {
    static init() {
        // Multiple declarations
        var x : Int64
        var y : UInt64
        func f() { 1 }
    }
}

abstract class A6 {
    static init() {
        // Multiple expressions
        print(1)
        print(2)
        print(3)
    }
}

abstract class A7 {
    static init() {
        // Declarations and expressions
        var x : Int64
        print(1)
        print(2)
        var y : UInt64
        func f() { 1 }
        print(3)
    }
}

main() { }
