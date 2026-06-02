/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_01_a03_01

  @Level:         1
  @Assertion:    2.2.1.1(3) The syntax of Arrayliteral is then defined as:
        arrayLiteral : '[' (elements)? ']' ;
        elements : element (',' element)* ;
        element : expression ;
        For Array literals, their elements are expressions:
        let emptyArray: Array<Int64> = [] // empty Array<Int64>
        let array0 = [1, 2, 3, 3, 2, 1] // array0 = [1, 2, 3, 3, 2, 1]
        let array1 = [1 + 3, 2 + 3, 3 + 3] // array1 = [4, 5, 6]

  @Description:  Checks that array can be created specifying it's elements

  @Mode:         run
  @Negative:     no
  @Structure:    single
*/
import utils.assert.*

func intFunc() {
    return 9 << 5
}

main(): Int64 {
    // let's check empty array can be constructed
    let a1: Array<Int64> = []
    Assert.equals(0, a1.size)
    Assert.isTrue(a1 is Array<Int64>)

    let a2: Array<Int64> = [-678, 18 * 7, 4 * 9 + 567,
        intFunc(), 123456]
    Assert.equals(5, a2.size)
    Assert.isTrue(a2 is Array<Int64>)
    Assert.equals(18 * 7, a2[1])
    Assert.equals(123456, a2[4])

    return 0
}
