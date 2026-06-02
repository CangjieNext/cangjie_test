
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_01_a03_01

  @Level:         1

  @Assertion:   4.22.1(3) Note that the f here does not support the init and super constructors.
  @Description: Checks that |> does not work with primary constructors. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C { 
    var x = 0

    C(y : Int64) { x = y }
}

main() {
    (1 |> C).x
    0
}
