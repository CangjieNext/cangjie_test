
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_02_a06_03

  @Level:         1

  @Assertion:   4.22.2(6) Note that the f and g here do not support the init and super constructors.
  @Description: Checks that ~> does not work with init constructors (via this).
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

func f(x : Int32) { Int64(x) }

class C { 
    var x = 0

    C(y : Int64) { x = y }

    init(y : Int32) { (this ~> f)(y) }
}

main() {
}
