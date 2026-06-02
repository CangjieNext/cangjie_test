
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a20_03

  @Level:         1

  @Assertion:   4.23(20)
                main(): Int64 { 
                    var a = 1
                    var b = 1
                    a = (b = 0) // semantics error
                    if (a = 5) { // semantics error

                    }
                    a = b = 0 // syntax error

                    return 0
                }
  @Description: Checks the given example (case a = b = 0).
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

main(): Int64 { 
    var a = 1
    var b = 1
    a = b = 0 // syntax error

    return 0
}