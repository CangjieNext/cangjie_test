/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a04_04

  @Level:         1

  @Assertion:       2.1.10.5(4) In above, StructName is the name of the struct, and arguments is the list of argument.
                    StructName(arguments) will invoke the closest matching constructor (based on the rules in section
                    Function overloading Resolution), and then generate an instance of StructName.
                    let newRectangle1_1 = Rectangle1() // Invoke the constructor defined by the empty init block.
                    let newRectangle1_2 = Rectangle1(100, 200) // Invoke the first custom constructor.
                    let newRectangle1_3 = Rectangle1(300) // Invoke the second custom constructor.

  @Description:     Check that given examples work.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006449

*/

import utils.assert.Assert

struct Rectangle1 {
    let width1: Int32
    let length1: Int32
    let perimeter1: () -> Int32
    init (width1: Int32, length1: Int32) {
        this.width1 = width1
        this.length1 = length1
        this.perimeter1 = { => 2 * (width1 + length1) }
    }
    init (side: Int32) {
        this(side, side)
    }
    func area1(): Int32 { width1 * length1 }
}

main() {
    let newRectangle1_2 = Rectangle1(100, 200) // Invoke the first custom constructor.
    let newRectangle1_3 = Rectangle1(300) // Invoke the second custom constructor.

    Assert.equals(100, newRectangle1_2.width1)
    Assert.equals(200, newRectangle1_2.length1)
    Assert.equals(600, newRectangle1_2.perimeter1())
    Assert.equals(20000, newRectangle1_2.area1())

    Assert.equals(300, newRectangle1_3.width1)
    Assert.equals(300, newRectangle1_3.length1)
    Assert.equals(1200, newRectangle1_3.perimeter1())
    Assert.equals(90000, newRectangle1_3.area1())
}
