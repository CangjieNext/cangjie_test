/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        01_02_a10_01

  @Level:         1
  @Assertion:   1.2(10) In the index access expression, a newline character cannot be used as a separator between [
                and the token preceding it.
  @Description: Checks that access by array index works OK when new line character is absent for different use cases.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.Assert;

main() {
// test case #1
    let arr1: Array<Array<Int64>> = [[0, 1], [2, 3], [4, 5]]
    var elem0 = arr1[0]
    var elem1 = arr1[1]
    var elem2 = arr1[2]
    Assert.equals(0, elem0[0])
    Assert.equals(2, elem1[0])
    Assert.equals(4, elem2[0])
    Assert.equals(1, elem0[1])
    Assert.equals(3, elem1[1])
    Assert.equals(5, elem2[1])

// test case #2
    let arr2: Array<Array<String>> = [["0", "1"], ["2", "3"], ["4", "5"]]
    var str0 = arr2[0]
    var str1 = arr2[1]
    var str2 = arr2[2]
    Assert.equals("0", str0[0])
    Assert.equals("2", str1[0])
    Assert.equals("4", str2[0])
    Assert.equals("1", str0[1])
    Assert.equals("3", str1[1])
    Assert.equals("5", str2[1])

// test case #3
    let arr3: Array<Array<Float64>> = [[0.0, 1.0], [2.0, 3.0], [4.0, 5.0]]
    var flt0 = arr3[0]
    var flt1 = arr3[1]
    var flt2 = arr3[2]
    Assert.equals(0.0, flt0[0])
    Assert.equals(2.0, flt1[0])
    Assert.equals(4.0, flt2[0])
    Assert.equals(1.0, flt0[1])
    Assert.equals(3.0, flt1[1])
    Assert.equals(5.0, flt2[1])

// test case #4
    let arr4 = Array<Int64>(3) { i => i + 2 }
    arr4[0] = -1
    arr4[1] = -2
    arr4[2] = -3
    Assert.equals(-1, arr4[0])
    Assert.equals(-2, arr4[1])
    Assert.equals(-3, arr4[2])

// test case #5
    let arr5 = Array<Int64>(2) { i => i * 2 }
    let arr6 = Array<Int64>(2) { i => i + 2 }
    let arr7: Array<Array<Int64>> = [arr5, arr6]
    Assert.equals(0, arr5[0])
    Assert.equals(3, arr6[1])

// test case #6
    let arr8: Array<Array<Array<Array<Array<Array<Int64>>>>>> = []

// test case #7
    let arr9  = [0, 1, 2, 3, 4, 5]
    let arr10 = arr9[2..3]
    Assert.equals(2, arr10[0])

// test case #8
    let arr11: Array<Int64> = arr9[..]
    arr11[0] = -1
    Assert.equals(-1, arr11[0])
}
