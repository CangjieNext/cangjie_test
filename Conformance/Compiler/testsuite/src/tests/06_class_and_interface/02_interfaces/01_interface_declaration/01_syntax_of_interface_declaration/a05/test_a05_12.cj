/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a05_12

  @Level:         1

  @Assertion: 6.2.1.1(5)
              Interfaces only can be defined in the top level.

  @Description: Check that an interface can not be defined inside an interface function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface J {
    func local(x: Int64) {
        interface I {}
        return 0
    }
}

main() {
}