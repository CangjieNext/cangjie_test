/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a03_06

  @Level:         1

  @Assertion: 6.1.4(3)
              This type is a subtype of the current type,
              and This can be automatically cast to the current type,
              but not vice versa.

  @Description: Check that a function with the return type this can not return
                a property of the type of the current class 

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

class Test {
    prop p: Test {
        get() {
            this
        }
    }
    func f(): This {
        return p
    }
}

main() {
}