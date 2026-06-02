/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a07_03

  @Level:         1

  @Assertion: 6.1.5(7)
              The following is an example:
              • When a1 and b1 are packaged in Box, the values assigned during initialization cannot be modified.
              • The values of a2 and b2 can be changed when they are packed by Box.
              • After being packaged, it can be accessed in a1.value mode and can be re-assigned a value to value.
              main(): Int64 {
                let a1 = 1
                var a2 = 2
                let b1 = Box(1)
                var b2 = Box(2)
                a1 = Box(a1) // Compile-time error.
                a2 = Box(a2) // Compile-time error.
                var a11 = Box(a1) // OK.
                b1 = Box(2) // Not allowed, compile-time error.
                b2 = Box(3) // OK.
                return 0
              }

  @Description: Check the second negative case

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

main(): Int64 {
    let a1 = 1
    var a2 = 2
    let b1 = Box(1)
    var b2 = Box(2)
    a2 = Box(a2) // Compile-time error.
    var a11 = Box(a1) // OK.
    b2 = Box(3) // OK.
    return 0
}