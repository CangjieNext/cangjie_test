/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a08_03

  @Level:         1

  @Assertion:   8(8) Extensions is a function that is appended after the type definition.

  @Description: Checks that adding extensions before type definition is not valid when the definition is in another
                package.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   complex-aux
  @Dependencies: aux_a08_02.cj
  @Issue:       


*/

package p

import default.default.*

class AuxA0801 {
    var x : Int64

    init(x : Int64) { this.x = x }
}

main() { }
