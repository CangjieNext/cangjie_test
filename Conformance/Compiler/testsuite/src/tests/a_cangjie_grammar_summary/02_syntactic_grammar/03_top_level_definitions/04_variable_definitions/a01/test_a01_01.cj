/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_04_a01_01

  @Level:         1
  @Assertion:   A.2.3.4(1) 
                variableDeclaration
                    : variableModifier* NL* (LET | VAR) NL* patternsMaybeIrrefutable
                     ( (NL* COLON NL* type)? (NL* ASSIGN NL* expression)
                    | (NL* COLON NL* type))
                    ;
                variableModifier
                    : PUBLIC
                    | PRIVATE
                    | PROTECTED
                    | STATIC
                    ;

  @Description: Check various variable declarations.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
public let l1 = 123
public let l2: Int8 = 10
public let l3 = (0x3, 'A')

public var v1 = 0.123
public var v2: Int16 = -20
public var v3 = (0b1001, "BBB")

let l4 = 0
let l5: Int64 = 0
let l6 = (0, 1..10)

var v4 = 0
var v5: Int64 = 0
var v6 = (0, [1,2,3])

class myClass{
  public let cl1: Int32 = 12
  public let cl2: Int32
  public var vl1: Int32 = 12
  public var vl2: Int32
  protected let cl3: Int32 = 12
  protected let cl4: Int32
  protected var vl3: Int32 = 12
  protected var vl4: Int32
  private let cl5: Int32 = 12
  private let cl6: Int32
  private var vl5: Int32 = 12
  private var vl6: Int32
  let cl7: Int32 = 12
  let cl8: Int32
  var vl7: Int32 = 12
  var vl8: Int32
  static let cl9: Int32 = 12
  static var vl9: Int32 = 12
  myClass (){
    cl2 = 123
    vl2 = 231
    cl4 = 345
    vl4 = 543
    cl6 = 456
    vl6 = 654
    cl8 = 789
    vl8 = 987
  }
}


main() {
    return 0
}