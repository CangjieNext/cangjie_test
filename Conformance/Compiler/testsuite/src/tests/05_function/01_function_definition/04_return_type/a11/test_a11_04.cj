/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a11_04

  @Level:         1

  @Assertion:     5.1.4(11) Note that the return value of a function has the semantics that defined by let. 

  @Description:   Check that function return value can not be changed:
                  local function inside other local function.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

func myGlobalFunc(i: Float32): Float32 {
    func myLocalFunc1() { "myLocalFunc1"}
    func myLocalFunc2() { 
        myLocalFunc1() = "myLocalFunc2"
        print("sgsdg")
    }
    return i
}

main() {
}
