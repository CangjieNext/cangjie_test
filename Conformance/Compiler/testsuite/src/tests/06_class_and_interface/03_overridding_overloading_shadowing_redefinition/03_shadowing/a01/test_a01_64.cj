/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_03_a01_64

  @Level:         1

  @Assertion: 6.3.3(1)
              During inheritance, a member of a subtype must not shadow a member of the supertype.
              If the shadowing occurs, an error will be compiled.

  @Description: Check that a static property from a struct
                can not shadow an instance function from the superinterface
                during interface implementation

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006441, 0006124

*/

interface I {
    func x() {}
}

struct C <: I {
    static prop x: Int64 {
        get() {
            1
        }
    }
}

main() {
}