/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a13_04

  @Level:         1

  @Assertion:     5.1(13) The function name cannot be assigned. That is, the function name cannot appear in the 
                  program as an expression lvalue.

  @Description:   Check that function can not be used in left side of expression:
                  local function name inside other local function.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myGlobalFunc(i: Float32): Float32 {
  func myLocalFunc1() { "myLocalFunc1"}
  func myLocalFunc2() { 
    myLocalFunc1 = "myLocalFunc2"
    print("sgsdg")
  }
  return i
}

main() {
}
