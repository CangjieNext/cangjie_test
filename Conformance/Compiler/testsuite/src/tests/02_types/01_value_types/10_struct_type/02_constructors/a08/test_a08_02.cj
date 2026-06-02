/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a08_02

  @Level:         1

  @Assertion: 2.1.10.2(8)
              The syntax and semantics of regular parameters are consistent 
              with those in the function definition.

  @Description: Check that parameters are evaluated left to right
                in the definition order
                during the primary constructor invocation

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: Excerpt from 5.1.2 Parameters:
            When a function is called, the parameter values are evaluated from left to right
            according to the sequence of definition

*/

import utils.assert.Assert

var str = ""

func gen_param(x: String) {
    str += x
    return 1
}

struct A {
    A(a: Int64, b: Int64, c: Int64, d!: Int64, e!: Int64 = 5, f!: Int64) {
        Assert.equals("abcdef", str)
    }
}

main() {
    let a = A(gen_param("a"), gen_param("b"), gen_param("c"), d: gen_param("d"), f: gen_param("f"), e: gen_param("e"))
}
