/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The syntax of interface members is as follows.
              interfaceMemberDeclaration
                : (functionDefinition|macroExpression|propertyDefinition) end*
                ;

  @Description: Macro definitions for interface members

  @Structure: complex-aux

  @MacroLib
*/

macro package p1

import std.ast.*

public macro InstFunc(name: Tokens, value: Tokens) {
    quote(func $name() {return $value})
}

public macro StaticFunc(name: Tokens, value: Tokens) {
    quote(static func $name() {return $value})
}

public macro StaticFuncGen(name: Tokens, value: Tokens) {
    quote(static func $name<T>() {return $value})
}

public macro InstFuncAbs(name: Tokens, type_: Tokens) {
    quote(func $name(): $type_)
}

public macro StaticFuncAbs(name: Tokens, type_: Tokens) {
    quote(static func $name(): $type_)
}

public macro StaticFuncAbsGen(name: Tokens, type_: Tokens) {
    quote(static func $name<T>(): $type_)
}

public macro InstProp(name: Tokens, value: Tokens) {
    quote(prop $name: Int64 {get() {$value}})
}

public macro InstMutProp(name: Tokens, value: Tokens) {
    quote(mut prop $name: Int64 {get() {$value} set(v) {}})
}

public macro StaticProp(name: Tokens, value: Tokens) {
    quote(static prop $name: Int64 {get() {$value}})
}

public macro StaticMutProp(name: Tokens, value: Tokens) {
    quote(static mut prop $name: Int64 {get() {$value} set(v) {}})
}

public macro InstPropAbs(name: Tokens, type_: Tokens) {
    quote(prop $name: $type_)
}

public macro InstMutPropAbs(name: Tokens, type_: Tokens) {
    quote(mut prop $name: $type_)
}

public macro StaticPropAbs(name: Tokens, type_: Tokens) {
    quote(static prop $name: $type_)
}

public macro StaticMutPropAbs(name: Tokens, type_: Tokens) {
    quote(static mut prop $name: $type_)
}

public macro Op(symbol: Tokens, value: Tokens) {
    quote(operator func $symbol() {return $value})
}

public macro OpAbs(symbol: Tokens, type_: Tokens) {
    quote(operator func $symbol(): $type_)
}