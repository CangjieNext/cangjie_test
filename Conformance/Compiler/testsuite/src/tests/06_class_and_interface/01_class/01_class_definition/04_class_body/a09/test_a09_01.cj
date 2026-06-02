/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a09_01

  @Level:         1

  @Assertion: 6.1.1.4(9)
              variableDeclaration indicates the declaration of a member variable.

  @Description: Check that a variable declared in the class body can be used in expressions as a variable
                and can be accessed through a class object for instance variables
                or through the class name for static variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This assertion references the syntax description for the class body:
            classBody
            : '{'
            classMemberDeclaration*
            classPrimaryInit?
            classMemberDeclaration*
            '}'
            ;
            classMemberDeclaration
            : classInit
            | staticInit
            | variableDeclaration
            | functionDefinition
            | operatorFunctionDefinition
            | macroExpression
            | propertyDefinition
            ;
*/

import utils.assert.Assert

class ClassWithVariables {
  var mem_var = 1
  let mem_let = 2

  static var static_var = 3
  static let static_let = 4
}

class GenericWithVariables<T> {
  public var mem_var: T
  public var mem_let: T

  public static var static_var = 10
  public static let static_let = 20

  init(x: T, y: T) {
    mem_var = x
    mem_let = y
  }
}

main() {
  var non_generic = ClassWithVariables()
  var generic_int = GenericWithVariables<Int64>(30, 40)
  var generic_string = GenericWithVariables<String>("a", "b")

  // Check types
  Assert.isTrue(non_generic.mem_var is Int64)
  Assert.isTrue(non_generic.mem_let is Int64)
  Assert.isTrue(generic_int.mem_var is Int64)
  Assert.isTrue(generic_int.mem_let is Int64)
  Assert.isTrue(generic_string.mem_var is String)
  Assert.isTrue(generic_string.mem_let is String)
  Assert.isTrue(ClassWithVariables.static_var is Int64)
  Assert.isTrue(ClassWithVariables.static_let is Int64)
  Assert.isTrue(GenericWithVariables<Int64>.static_var is Int64)
  Assert.isTrue(GenericWithVariables<Int64>.static_let is Int64)

  // Check that variable's value can be read
  var tmp1 = non_generic.mem_var
  Assert.equals(1, tmp1)
  var tmp2 = non_generic.mem_let
  Assert.equals(2, tmp2)
  var tmp3 = ClassWithVariables.static_var
  Assert.equals(3, tmp3)
  var tmp4 = ClassWithVariables.static_let
  Assert.equals(4, tmp4)
  var tmp5 = generic_int.mem_var
  Assert.equals(30, tmp5)
  var tmp6 = generic_int.mem_let
  Assert.equals(40, tmp6)
  var tmp7 = generic_string.mem_var
  Assert.equals("a", tmp7)
  var tmp8 = generic_string.mem_let
  Assert.equals("b", tmp8)
  var tmp9 = GenericWithVariables<Int64>.static_var
  Assert.equals(10, tmp9)
  var tmp10 = GenericWithVariables<Int64>.static_let
  Assert.equals(20, tmp10)

  // Check that mutable variables can be written to
  non_generic.mem_var = 5
  Assert.equals(5, non_generic.mem_var)
  ClassWithVariables.static_var = 7
  Assert.equals(7, ClassWithVariables.static_var)
  generic_int.mem_var = 19
  Assert.equals(19, generic_int.mem_var)
  generic_string.mem_var = "c"
  Assert.equals("c", generic_string.mem_var)
  GenericWithVariables<Int64>.static_var = 11
  Assert.equals(11, GenericWithVariables<Int64>.static_var)

  // Check that class variables can participate in other expressions as correct names
  let a = non_generic.mem_var + GenericWithVariables<Int64>.static_let
  Assert.equals(25, a)

  let b = generic_int.mem_let << non_generic.mem_let
  Assert.equals(160, b)

  var c = match(generic_string.mem_var) {
    case "a" => 1
    case "c" => 0
    case  _  => -1
  }
  Assert.equals(0, c)

  let d = ClassWithVariables.static_var > generic_int.mem_var
  Assert.equals(false, d)

  let e = {x: Int64 => x + 1}(ClassWithVariables.static_let)
  Assert.equals(5, e)

  let f = generic_string.mem_let + "${GenericWithVariables<Int64>.static_var}"
  Assert.equals("b11", f)
}
