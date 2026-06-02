/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: After macro expanded, the macros must comply with the syntax definition of classMemberDeclaration.

  @Description: Macro definitions for assertion

  @MacroLib

  @Structure: complex-aux
*/

macro package ml

import std.ast.*

// Correct macros
public macro StaticVar(name: Tokens, val: Tokens) {
  quote(static var $name = $val)
}

public macro InstanceVar(name: Tokens, val: Tokens) {
  quote(let $name = $val)
}

public macro PrimaryConstructor(name: Tokens, val: Tokens) {
  quote($name() {$val})
}

public macro InitConstructor(param: Tokens, mem: Tokens) {
  quote(init($param: Int64) {$mem = $param})
}

public macro StaticInitializer(expr: Tokens) {
  quote(static init() {$expr})
}

public macro Function(name: Tokens, val: Tokens) {
  quote(func $name() {return $val})
}

public macro GenericFunction(name: Tokens, val: Tokens) {
  quote(func $name<T, U>() {return $val})
}

public macro StaticFunction(name: Tokens, val: Tokens) {
  quote(static func $name() {return $val})
}

public macro OperatorOverload(op_type: Tokens, val: Tokens) {
  quote(operator func$op_type {return $val})
}

public macro Property(name: Tokens, val: Tokens) {
  quote(prop $name: Int64 { get() {$val} })
}

public macro StaticProperty(name: Tokens, val: Tokens) {
  quote(static mut prop $name: Int64 { get() {$val} set(v) {} })
}

public macro AnotherMacro(name: Tokens, val: Tokens) {
  quote(@Function[$name]($val))
}

// Incorrect macros
public macro MalformedFunction(name: Tokens) {
  quote(func foo() {)
}

public macro MalformedVariable(name: Tokens) {
  quote(var $name 1)
}

public macro MalformedOperator(op_type: Tokens) {
  quote(func operator $op_type {})
}

public macro MalformedProperty(name: Tokens) {
  quote(prop $name {})
}

public macro MalformedPrimary(name: Tokens) {
  quote($name {})
}

public macro MalformedInit(name: Tokens) {
  quote(init())
}

public macro MalformedStatic(typee: Tokens) {
  quote(static init(x: $typee) {})
}

public macro MacroStruct(name: Tokens) {
  quote(struct $name {})
}

public macro MacroGibberish(name: Tokens) {
  quote(-*/+$name)
}

public macro Echo(input: Tokens) {
  quote($input)
}