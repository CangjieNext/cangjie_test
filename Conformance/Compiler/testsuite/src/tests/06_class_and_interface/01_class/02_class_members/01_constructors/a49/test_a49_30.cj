/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a49_30

  @Level:         1

  @Assertion: 6.1.2.1(49)
              Not allowed to use the instance member variable this.variableName
              and its syntax sugar variableName
              or super.variableName as the default value of constructor parameters.

  @Description: Check that an initialized public immutable member variable
                can not be used directly as the default value of constructor parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init(p!: Int64 = x) {
    }

    public let x = 1
}

main() {
}