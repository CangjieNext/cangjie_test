
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        10_02_03_a20_01

  @Level:         1

  @Assertion:   10.2.3(20)
                For enumeration types, if both the constructor form and the overloaded function of the
                () operator are satisfied, the constructor form is preferentially matched.
  @Description: Checks for enum E that E() is considered a constructor call when both constructor and () overloading
                are present
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var check = ""

enum E { 
    E1(Int64)
    operator func ()(x : Int64) { check="(Int64)" } 
} 

main() { 
    E1(1)
    Assert.equals("", check)
}
