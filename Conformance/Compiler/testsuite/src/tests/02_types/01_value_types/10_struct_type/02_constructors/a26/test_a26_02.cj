/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a26_02

  @Level:         1

  @Assertion: 2.1.10.2(26)
              A primary constructor is a syntax sugar of regular constructor.
              The compiler automatically generates a definition of the constructor
              and member variables corresponding to the main constructor,
              the form of the automatically generated constructor is as follows:
              • The modifier is the same as that of the primary constructor.
              • The sequence of parameters from left to right is the same as that of parameters
                declared in the primary constructor parameter list.
              • The constructor body is in the following format:
                – Assign values to member variables in sequence.
                  The syntax format is this.x = x, where x indicates the member variable name.
                – Then other code inside the primary constructor body.

  @Description: Check that parameters of the generated constructor are
                evaluated in the same order as written in the primary constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""
var sequence = 0

// Regular unnamed parameters and all member variable parameters
struct Test1 {
    Test1(
        p1: Int64,
        p2: Int64,
        let p3: Int64,
        var p4: Int64,
        public let p5!: Int64,
        private var p6!: Int64
    ) {
        Assert.equals("p1p2p3p4p5p6", order)
        Assert.equals(1, p1)
        Assert.equals(2, p2)
        Assert.equals(3, p3)
        Assert.equals(4, p4)
        Assert.equals(5, p5)
        Assert.equals(6, p6)
    }
}

// All regular parameters and named member variable parameters
struct Test2 {
    Test2(
        p1: Int64,
        p2: Int64,
        p3!: Int64,
        p4!: Int64,
        public let p5!: Int64,
        private var p6!: Int64
    ) {
        Assert.equals("p1p2p3p4p5p6", order)
        Assert.equals(7, p1)
        Assert.equals(8, p2)
        Assert.equals(9, p3)
        Assert.equals(10, p4)
        Assert.equals(11, p5)
        Assert.equals(12, p6)
    }
}

func eval_param(x: String) {
    order += x
    sequence++
    return sequence
}

main() {
    let a = Test1(
        eval_param("p1"),
        eval_param("p2"),
        eval_param("p3"),
        eval_param("p4"),
        p5: eval_param("p5"),
        p6: eval_param("p6")
        )

    order = ""

    let b = Test2(
        eval_param("p1"),
        eval_param("p2"),
        p3: eval_param("p3"),
        p4: eval_param("p4"),
        p5: eval_param("p5"),
        p6: eval_param("p6")
        )
}