
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_02_a01_02

  @Level:         1

  @Assertion:   4.7.2(1) A continue expression can only be used in loop bodies.
  @Description: Checks that break is not allowed inside a function but outside of a loop.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    continue
    return 0
}
