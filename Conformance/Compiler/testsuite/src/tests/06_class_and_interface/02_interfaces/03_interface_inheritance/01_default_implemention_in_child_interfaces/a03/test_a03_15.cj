/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a03_15

  @Level:         1

  @Assertion: 6.2.3.1(3)
              If a subinterface inherits a function or property
              that has a default implementation in the superinterface,
              it is not allowed to give only the declaration of this function or property
              but without definition in the subinterface

  @Description: Check that a subinterface can not declare a static immutable property with the 'redef' modifier
                if it has a default implementation in the superinterface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I {
    static prop p: Int64 {
        get() {
            1
        }
    }
}

interface J <: I {
    redef static prop p: Int64
}

main() {
}