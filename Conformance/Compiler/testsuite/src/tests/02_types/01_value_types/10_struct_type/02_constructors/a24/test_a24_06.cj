/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a24_06

  @Level:         1

  @Assertion: 2.1.10.2(24)
              Declarations and expressions are allowed in the primary constructor body
              but must meet the requirements of init constructors.

  @Description: Check that 'this' can not be used as a separate expression inside 
                the primary constructor after all the instance variables are initialized

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @Issue: 0006484

  @Comment: From the description in the init constructor section:
            Also, this cannot be used as a separate expression.

*/

struct A {
    A() {
        this.x = 1
        
        let a = this
    }

    var x: Int64
}

main() {
}