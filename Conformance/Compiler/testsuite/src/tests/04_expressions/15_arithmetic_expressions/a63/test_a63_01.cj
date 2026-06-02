
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a63_01

  @Level:         1

  @Assertion:   4.15(63)
                let a: Int32 = 2147483647 // int_MAX 
                let b: Int32 = 1
                let c: Int32 = b + a // throw an ArithmeticException
  @Description: Checks that the example above does not compile since there's an overflow.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    let a: Int32 = 2147483647 // int_MAX 
    let b: Int32 = 1
    let c: Int32 = b + a // throw an ArithmeticException
}