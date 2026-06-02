/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_02_a02_01

  @Level:         1

  @Assertion:  2.1.12.2(2) For example:
               It should be noted that, when we access an element in a VArray, 
               a copy of the element will be returned. This means that, 
               if the element is of type Tand Tis a value type, we will get
               a new immutable instance. For a multi-dimensional VArray instance,
               we are forbidden to modify the elements in the inner VArray via arr[n][m] = e,
               because the VArray we get from arr[n]is a new,
               copied instance of the original inner VArray.
               var arr7 :VArray <Int64 ,$2>=[0,1]
               let element0 =arr7[ 0] // element0 = 0
               arr7[ 1]=10 // change the value of the second element of 'array5' through index
               // Get and Set of multi-dimensional VArrays.
               var arr8 :VArray <VArray <Int64 ,$2>,$2>=[[1,2],[3,4]]
               let arr9 :VArray <Int64 ,$2>=[0,1]
               let element1 =arr8[ 1][0] // element1 = 3
               arr8[ 1][1]=5 // error: function call returns immutable value
               arr8[ 1]=arr9 // arr8 = [[1, 2], [0, 1]]

  
  @Description:  Test from given example

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $3>

*/

import utils.assert.Assert
main() {
    var arr7: VArray<Int64, $2> = [0, 1]

    let element0 = arr7[0] // element0 = 0
    Assert.equals(0, element0)

    arr7[1] = 10 // change the value of the second element of 'array5' through index
    Assert.equals(10, arr7[1])

    // Get and Set of Multidimensional Arrays.
    var arr8: VArray<VArray<Int64, $2>, $2> = [[1, 2], [3, 4]]
    let arr9 :VArray <Int64 ,$2>=[0,1]
    let element1 = arr8[1][0] // element1 = 3
    Assert.equals(3, element1)
    
    arr8[1]=arr9 // arr8 = [[1, 2], [0, 1]]
    Assert.equals(0, arr8[1][0])
    Assert.equals(1, arr8[1][1])
    0
}