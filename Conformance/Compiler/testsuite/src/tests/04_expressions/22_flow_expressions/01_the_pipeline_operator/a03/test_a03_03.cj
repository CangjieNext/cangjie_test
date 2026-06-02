
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_01_a03_03

  @Level:         1

  @Assertion:   4.22.1(3) Note that the f here does not support the init and super constructors.
  @Description: Checks that |> does not work with super constructors. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

open class C1 { 
    var x = 0

    C1(y : Int64) { x = y }
}

class C2 <: C1 {
    C2(y : Int64) { y |> super }
}

main() {

}
