/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_06_a01_06

  @Level:         1

  @Assertion:     5.1.6(1) Non-generic functions of the same name with the same parameter types in the same scope are 
                  considered to be redefined and a compilation error will be raised. 

  @Description:   Check that non-generic struct member functions of the same name with the same parameter types in 
                  the same scope are considered to be redefined and a compilation error will be raised.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

struct myStruct {
  func myFunc(a: Int32, b!: Int32): Int32 { a + b}
  func myFunc(a: Int32, b!: Int32): Int32 { a - b}
}

main() {
}
