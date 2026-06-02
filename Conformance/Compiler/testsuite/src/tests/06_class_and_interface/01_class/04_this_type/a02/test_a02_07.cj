/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a02_07

  @Level:         1

  @Assertion: 6.1.4(2)
              A function whose return type is This can only return an expression of type This,
              no other expression is allowed.
              Expressions of type This contain this and calls to other functions that return This.

  @Description: Check that a function with the return type this can not explicitly return
                the call to a local function that returns this

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006299

*/

class Test {
    func f(): This {
        func local() {
            return this
        }
        return local()
    }
}

main() {
}
