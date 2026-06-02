
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a05_01

  @Level:         1

  @Assertion:   4.7(5) 
                main(): Int64 {
                    return return 1 // warning: the left return expression is unreachable
                }
  @Description: Checks that the given example reports a warning. 
  @Mode: run
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main(): Int64 {
    return return 1 // warning: the left return expression is unreachable
}
