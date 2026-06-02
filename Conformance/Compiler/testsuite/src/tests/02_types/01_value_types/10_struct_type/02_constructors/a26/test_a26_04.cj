/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a26_04

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

  @Description: Check that instance variables generated from member variable parameters
                are accessible immidiately in the primary constructor body,
                meaning initializations were generated before the code in the body

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct Test {
    Test(
        public var p1: Int64,
        private var p2: Int64,
        var p3: Int64,
        public let p4: Int64,
        private let p5: Int64,
        let p6: Int64,
        public var p7!: Int64,
        private var p8!: Int64,
        var p9!: Int64,
        public let p10!: Int64,
        private let p11!: Int64,
        let p12!: Int64
    ) {
        let a = this.p1 + this.p2 +this.p3 + this.p4 + this.p5 + this.p6 + this.p7 + this.p8 +
                this.p9 + this.p10 + this.p11 + this.p12
        Assert.equals(0b111111111111, a)
    }
}

main() {
    let tst = Test(1, 2, 4, 8, 16, 32, p7: 64, p8: 128, 
        p9: 256, p10: 512, p11: 1024, p12: 2048)
}