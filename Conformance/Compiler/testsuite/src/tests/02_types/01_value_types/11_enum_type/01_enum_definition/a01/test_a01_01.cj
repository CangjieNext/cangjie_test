/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_11_01_a01_01

  @Level:         1

  @Assertion: 2.1.11.1(1)
              The syntax of the definition of enum types is:

              enumDefinition
                  : enumModifier? 'enum' identifier typeParameters?
                    ('<:' superInterfaces)? genericConstraints? '{' enumBody '}'
                  ;

              enumBody
                  : '|'? caseBody ('|' caseBody)*
                    (functionDefinition |
                     operatorFunctionDefinition |
                     propertyDefinition |
                     macroExpression)*
                  ;

              caseBody
                  : identifier ('(' type (',' type)* ')')?
                  ;

              In above, enumModifier indicates the modifier (public) of enum, and enum is the keyword, and identifier
              is the name of the enum type.

              typeParameters and genericConstraints are list of type variables and their constraints (refer to chapter
              10 for generics), respectively.

  @Description: Check enum definition syntax positive examples.

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_macros_01.cj

  @Issue: 0006124
*/

import aux_macros_01.*

interface I {}

// Rule:  enumDefinition
// Case:  enumDefinition = 'enum' identifier '{' enumBody '}'
enum E1 {
    | A
    | B
}

// Rule:  enumDefinition
// Case:  enumDefinition = enumModifier 'enum' identifier '{' enumBody '}'
public enum E2 {
    | A
    | B
}

// Rule:  enumDefinition
// Case:  enumDefinition = 'enum' identifier typeParameters '{' enumBody '}'
enum E3<T> {
    | A(T)
    | B
}

// Rule:  enumDefinition
// Case:  enumDefinition = 'enum' identifier <: superInterfaces '{' enumBody '}'
enum E4 <: I {
    | A
    | B
}

// Rule:  enumDefinition
// Case:  enumDefinition = 'enum' identifier typeParameters <: superInterfaces '{' enumBody '}'
enum E5<T> <: I {
    | A(T)
    | B
}

// Rule:  enumDefinition
// Case:  enumDefinition = 'enum' identifier typeParameters <: superInterfaces genericConstraints '{' enumBody '}'
enum E6<T> <: I where T <: I {
    | A(T)
    | B
}

// Rule:  enumBody
// Case:  enumBody = caseBody
enum E7 {
    A
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody
enum E8 {
    | A
}

// Rule:  enumBody
// Case:  enumBody = caseBody '|' caseBody
enum E9 {
    A | B
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody
enum E10 {
    | A
    | B
}

// Rule:  enumBody
// Case:  enumBody = caseBody '|' caseBody '|' caseBody
enum E11 {
    A | B | C
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody '|' caseBody
enum E12 {
    | A
    | B
    | C
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody functionDefinition
enum E13 {
    | A
    | B

    func foo() {}
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody operatorFunctionDefinition
enum E14 {
    | A
    | B

    operator func+(x: Int64) { 42 }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody propertyDefinition
enum E15 {
    | A
    | B

    prop x: Int64 {
        get() { 42 }
    }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody macroExpression
enum E16 {
    | A
    | B

    @Identity(func foo() {})
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody functionDefinition functionDefinition
enum E17 {
    | A
    | B

    func foo1() {}
    func foo2() {}
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody functionDefinition operatorFunctionDefinition
enum E18 {
    | A
    | B

    func foo1() {}
    operator func+(x: Int64) { 42 }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody functionDefinition propertyDefinition
enum E19 {
    | A
    | B

    func foo1() {}

    prop x: Int64 {
        get() { 42 }
    }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody functionDefinition macroExpression
enum E20 {
    | A
    | B

    func foo1() {}
    @Identity(func foo2() {})
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody operatorFunctionDefinition operatorFunctionDefinition
enum E21 {
    | A
    | B

    operator func+(x: Int64) { 42 }
    operator func-(x: Int64) { 35 }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody operatorFunctionDefinition propertyDefinition
enum E22 {
    | A
    | B

    operator func+(x: Int64) { 42 }

    prop x: Int64 {
        get() { 42 }
    }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody operatorFunctionDefinition macroExpression
enum E23 {
    | A
    | B

    operator func+(x: Int64) { 42 }
    @Identity(func foo2() {})
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody propertyDefinition propertyDefinition
enum E24 {
    | A
    | B

    prop x: Int64 {
        get() { 42 }
    }
    prop y: Int64 {
        get() { 42 }
    }
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody propertyDefinition macroExpression
enum E25 {
    | A
    | B

    prop x: Int64 {
        get() { 42 }
    }

    @Identity(func foo1() {})
}

// Rule:  enumBody
// Case:  enumBody = '|' caseBody '|' caseBody macroExpression macroExpression
enum E26 {
    | A
    | B

    @Identity(func foo1() {})
    @Identity(func foo2() {})
}

// Rule:  caseBody = identifier ('(' type (',' type)* ')')?
// Case:  caseBody = identifier
enum E27 {
    | A
}

// Rule:  caseBody = identifier ('(' type (',' type)* ')')?
// Case:  caseBody = identifier '(' type ')'
enum E28 {
    | A(Int64)
}

// Rule:  caseBody = identifier ('(' type (',' type)* ')')?
// Case:  caseBody = identifier '(' type ',' type ')'
enum E29 {
    | A(Int64, Float64)
}

main() {}

