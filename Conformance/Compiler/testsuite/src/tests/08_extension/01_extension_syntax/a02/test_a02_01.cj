/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 08_01_a02_01

  @Level:         1

  @Assertion: 8.1(2)
              The syntax of the extended definition is as follows.

              extendDefinition
                  : 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
                  ;

              extendType
                  : (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
                  ;

              extendBody
                  : '{' extendMemberDeclaration* '}'
                  ;

              extendMemberDeclaration
                  : (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
                  ;

  @Description: Check positive extendDefinition examples.

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a02_aux.cj aux_macros_02.cj

  @Issue: 6124
*/

import a02
import a02.A
import a02.AT
import aux_macros_02.*

import utils.assert.Assert

//
// Rule: extendDefinition => 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
// Case: extendDefinition => 'extend' extendType extendBody
//

extend String {
    func e1GetSize() { this.size }
}

//
// Rule: extendDefinition => 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
// Case: extendDefinition => 'extend' extendType '<:' superInterfaces extendBody
//

interface IReturnSize {
    func iReturnSize(): Int64
}

extend String <: IReturnSize {
    public func iReturnSize(): Int64 { this.size }
}

//
// Rule: extendDefinition => 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
// Case: extendDefinition => 'extend' extendType genericConstraints extendBody
//

extend <T> Option<T> where T <: Collection<Byte> {
    func e3GetOptionStringSize() { this?.size ?? 0 }
}

//
// Rule: extendDefinition => 'extend' extendType ('<:' superInterfaces)? genericConstraints? extendBody
// Case: extendDefinition => 'extend' extendType '<:' superInterfaces genericConstraints extendBody
//

extend <T> Option<T> <: IReturnSize where T <: Collection<Byte> {
    public func iReturnSize(): Int64 { this?.size ?? 0 }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier
//

extend String {
    func e5GetSize() { this.size }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier typeParameters
//

extend <T> Option<T> where T <: Collection<Byte> {
    func e6GetSize(): Int64 { this?.size ?? 0 }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier NL typeParameters
//

extend <T> Option
    <T> where T <: Collection<Byte> {
    func e7GetSize(): Int64 { this?.size ?? 0 }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier NL NL typeParameters
//

extend <T> Option

    <T> where T <: Collection<Byte> {
    func e8GetSize(): Int64 { this?.size ?? 0 }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier.identifier
//

extend a02.A {
    func e9SayHello() { "hello" }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier NL NL . NL NL identifier
//

extend a02

    .
    
    A {
    func e10SayHello() { "hello" }
}

//
// Rule: extendType = (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
// Case: extendType = identifier.identifier typeParameters
//

extend <T> a02.AT<T>{
    func e11SayHello() { "hello" }
}

//
// Rule: extendBody = '{' extendMemberDeclaration* '}'
// Case: extendBody = '{' '}'
//

extend String {}


//
// Rule: extendBody = '{' extendMemberDeclaration* '}'
// Case: extendBody = '{' extendMemberDeclaration '}'
//

extend String {
    func e13GetSize() { this.size }
}

//
// Rule: extendBody = '{' extendMemberDeclaration* '}'
// Case: extendBody = '{' extendMemberDeclaration extendMemberDeclaration '}'
//

extend String {
    func e14GetSize1() { this.size }
    func e14GetSize2() { this.size }
}

//
// Rule: extendBody = '{' extendMemberDeclaration* '}'
// Case: extendBody = '{' extendMemberDeclaration extendMemberDeclaration extendMemberDeclaration '}'
//

extend String {
    func e15GetSize1() { this.size }
    func e15GetSize2() { this.size }
    func e15GetSize3() { this.size }
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = functionDefinition
//

extend String {
    func e16GetSize() { this.size }
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = operatorFunctionDefinition
//

struct N1 {
    N1(var value!: Int64) {}
}

extend String {
    operator func+(arg: N1) {
        return this + arg.value.toString()
    }
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = propertyDefinition
//

class C {
    var x: Int64 = 7
}

extend C {
    mut prop val: Int64 {
        get() { x }
        set(v) { x = v }
    }
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = macroExpression
//

extend String {
    @Identity(func e19GetSize() { this.size })
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = functionDefinition end
//

extend String {
    func e20GetSize() { this.size }
    ;
}

//
// Rule: extendMemberDeclaration =
//          (functionDefinition | operatorFunctionDefinition | propertyDefinition | macroExpression) end*
// Case: extendMemberDeclaration = functionDefinition end end
//

extend String {
    func e21GetSize() { this.size }
    ;;
}

main() {
    Assert.equals(5, "hello".e1GetSize())

    Assert.equals(5, "hello".iReturnSize())

    Assert.equals(5, Option<String>.Some("hello").e3GetOptionStringSize())

    Assert.equals(5, Option<String>.Some("hello").iReturnSize())

    Assert.equals(5, "hello".e5GetSize())

    Assert.equals(5, Option<String>.Some("hello").e6GetSize())

    Assert.equals(5, Option<String>.Some("hello").e7GetSize())

    Assert.equals(5, Option<String>.Some("hello").e8GetSize())

    Assert.equals("hello", a02.A().e9SayHello())

    Assert.equals("hello", a02.A().e10SayHello())

    Assert.equals("hello", a02.AT<Int64>().e11SayHello())

    Assert.equals(5, "hello".e13GetSize())

    Assert.equals(5, "hello".e14GetSize1())
    Assert.equals(5, "hello".e14GetSize2())

    Assert.equals(5, "hello".e15GetSize1())
    Assert.equals(5, "hello".e15GetSize2())
    Assert.equals(5, "hello".e15GetSize3())

    Assert.equals(5, "hello".e16GetSize())

    Assert.equals("hello5", "hello" + N1(value: 5))

    Assert.equals(7, C().val)

    Assert.equals(5, "hello".e19GetSize())

    Assert.equals(5, "hello".e20GetSize())

    Assert.equals(5, "hello".e21GetSize())

    return
}

