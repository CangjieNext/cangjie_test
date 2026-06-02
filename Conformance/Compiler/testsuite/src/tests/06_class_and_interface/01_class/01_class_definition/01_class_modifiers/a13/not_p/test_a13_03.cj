/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a13_03

  @Level:         1

  @Assertion:   6.1.1.1(13) –sealed: You can use the sealed modifier to indicate that the class can be inherited only
                in the package which the class is defined.
  @Description: Checks that sealed abstract class cannot be inherited in another package.
  @Mode: compileonly
  @Negative: yes
  @Structure: complex-main
  @Dependencies: ../p/aux_a13.cj
  @CompileWarning: no
  @Issue: 6084

*/

package not_p

import p.A

class A0 <: A { }

main() { }
