/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a04_05

  @Level:         1

  @Assertion: 6.1.4(4)
              The This type cannot be used explicitly within a function.

  @Description: Check that This type can not be used in a type pattern
                inside a member function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    func f(x: Object) {
        match(x) {
            case y: This => 1
            case _ => 2
        }
    }
}

main() {
}