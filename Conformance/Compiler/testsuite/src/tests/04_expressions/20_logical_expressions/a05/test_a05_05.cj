
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a05_05

  @Level:         1

  @Assertion:   4.20(5) Logic NOT (!) is a prefix-unary operator.
  @Description: Checks that standalone ! is not permitted. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore

*/

func f() : Bool { ! }

main() {
    f()
    0
}
