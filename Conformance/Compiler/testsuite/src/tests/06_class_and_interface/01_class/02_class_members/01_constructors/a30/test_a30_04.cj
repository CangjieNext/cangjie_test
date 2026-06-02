/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a30_04

  @Level:         1

  @Assertion: 6.1.2.1(30)
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
                – The code in the primary constructor body.

  @Description: Check that instance variables generated from member variable parameters
                are accessible immidiately in the primary constructor body,
                meaning initializations were generated before the code in the body

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
  Test(
    public var p1: Int64,
    protected var p2: Int64,
    private var p3: Int64,
    var p4: Int64,
    public let p5: Int64,
    protected let p6: Int64,
    private let p7: Int64,
    let p8: Int64,
    public var p9!: Int64,
    protected var p10!: Int64,
    private var p11!: Int64,
    var p12!: Int64,
    public let p13!: Int64,
    protected let p14!: Int64,
    private let p15!: Int64,
    let p16!: Int64
  ) {
    let a = this.p1 + this.p2 +this.p3 + this.p4 + this.p5 + this.p6 + this.p7 + this.p8 +
            this.p9 + this.p10 + this.p11 + this.p12 + this.p13 + this.p14 + this.p15 + this.p16
    Assert.equals(0b1111111111111111, a)
  }
}

main() {
  let tst = Test(1, 2, 4, 8, 16, 32, 64, 128, 
    p9: 256, p10: 512, p11: 1024, p12: 2048, p13: 4096, p14: 8192, p15: 16384, p16: 32768)
}