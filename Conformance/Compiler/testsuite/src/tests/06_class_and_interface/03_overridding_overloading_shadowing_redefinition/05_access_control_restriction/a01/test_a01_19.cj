/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a01_19

  @Level:         1

  @Assertion: 6.3.5(1)
              The access modifier level is specified as follows
              based on the allowed access scope of the access modifier:
              • Access modifier level: public > protected > default > private.

  @Description: Check that a static non-generic function with the 'private' modifier
                is not visible outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a01_p04_aux.cj

  @Comment: The current chapter is about the redefenition and overriding. So only functions are tested.

*/

import p04.*

main() {
    A01P04Aux.f3()
}