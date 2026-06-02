
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a19_05

  @Level:         1

  @Assertion:   10.2.3(19)
                The () operator overload function cannot be called with this or super.
  @Description: Check that () cannot be called with this from a constructor when there is no constructor with the same
                arguments as the overloaded operator ().
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C {
    operator func ()(x : Int64) {  }

    init() { this(x) }
}

main() { }
