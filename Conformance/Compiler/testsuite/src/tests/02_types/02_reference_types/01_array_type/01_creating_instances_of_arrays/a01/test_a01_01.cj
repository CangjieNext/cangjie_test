/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_01_a01_01

  @Level:         1
  @Assertion:    2.2.1.1(1) There are 2 ways for creating an instance of array:
    Constructor
    // Array<T>()
    let emptyArr1 = Array<Int64>() // create an empty array whose type
                                   // is Array<Int64>
    let emptyArr2 = Array<String>() // create an empty array whose type
                                    // is Array<String>

    // Array<T>(size: Int64, initElement: (Int64)->T)
    let array3 = Array<Int64>(3) { i => i * 2 } // 'array3' has 3 elememts:
                                                // 0, 2, 4
    let array4 = Array<String>(2) { i => "$i" } // 'array4' has 2 elememts:
                                                // "0", "1"

  @Description:  Checks that both empty and non-empty arrays can be created

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../array_commons.cj
*/
import utils.assert.*
import array_commons.*

main(): Int64 {
    // let's check empty array can be constructed
    let a1 = Array<Int32>()
    Assert.equals(0, a1.size)
    Assert.isTrue(a1 is Array<Int32>)

    let a2 = Array<String>()
    Assert.equals(0, a2.size)
    Assert.isTrue(a2 is Array<String>)

    let a3 = Array<I>()
    Assert.equals(0, a3.size)
    Assert.isTrue(a3 is Array<I>)

    // let's check array of different size/type creation
    let a4 = Array<Int64>(5) { i => i }
    Assert.equals(5, a4.size)
    Assert.isTrue(a4 is Array<Int64>)
    Assert.equals(3, a4[3])

    let a5 = Array<Float64>(12) { i => 140.0 * Float64(i) }
    Assert.equals(12, a5.size)
    Assert.isTrue(a5 is Array<Float64>)
    Assert.equals(8.0 * 140.0, a5[8])

    let a6 = Array<Bool>(0) { i => false }
    Assert.equals(0, a6.size)
    Assert.isTrue(a6 is Array<Bool>)

    return 0
}
