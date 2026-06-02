
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_a06_03

  @Level:         1

  @Assertion:   4.7(6) As for the control transfer expressions, break and continue must have their enclosing loop
                bodies;
  @Description: Checks that break is not allowed inside a function but outside of a loop.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    break
    return 0
}
