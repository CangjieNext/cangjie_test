/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a03_01

  @Level:         1
  @Assertion:       3.2.2(3) Names in its nested scope can be accessed directly by using the name without 
                    any qualifier, if they are not shadowed or overridden.

  @Description:     Test for "Names in its nested scope can be accessed directly".

  @Mode:            run
  @Negative:        no
  @Structure:       complex-main
  @Dependencies:    aux_test_a03_01.cj
  @CompileWarning:  no

*/

import runtime.AuxTestA0301

import utils.assert.Assert

func f() { 0 }

main() {
    if (let a <- AuxTestA0301().true_) {
        for (i in [1]) {
        println("1")
            Assert.equals(f() + i == 1, a)
        }
    }

    var lambda = { inp: Bool =>
        do {
        println("2")
            Assert.isFalse(inp)
            Assert.equals(0, f())
        } while (inp)
        println("3")
        "0001"
    }

    var i = 0
    while (i < 2) {
        println("4")
        Assert.isTrue(lambda(!AuxTestA0301().true_).contains("${f()}${i}"))
        i++
    }
}
