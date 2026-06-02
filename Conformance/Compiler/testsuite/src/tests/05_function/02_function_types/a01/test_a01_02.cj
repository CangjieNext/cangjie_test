/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_02_a01_02

  @Level:         1

  @Assertion:     5.2(1) Each function has a specific type, which is determined by the types of its parameters 
                  (hereafter parameter type) and its return type, written in the form of parameterType -> 
                  returnType. 
                  functionType: 
                    : '(' (type (, type)*)? ')' '->' type

  @Description:   Check that function type can be defined with parameters names.

  @Mode:          run

  @Negative:      No

  @Structure:     single

*/
func myFunc2(k: Int32, l: Int32): (s: Int32, g: Int32) { (k, l) }

main() {
  return myFunc2(0, 1)[0]
}
