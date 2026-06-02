/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_01_a05_01

  @Level:         1

  @Assertion:    2.1.12.1(5)
                let arr1: VArray<Int64 ,$5> = [1,2,3,4,5]
                let arr2: VArray<Int16 ,$0> = []
                let arr3: VArray<Int16 ,$0> = [1] // error
                let arr4: VArray<Int16 ,$-1> = [] // error
                In addition to this, VArray can also be created as an instance using a constructor.
                // VArray<T, $IntLiteral>(initElement: (Int64)->T)
                let arr5: VArray<Int64 ,$5> = VArray<Int64 ,$5> { i=>i } // [0, 1, 2, 3, 4]
                let arr6: VArray<Int64 ,$5> = VArray<Int64 ,$5>(repeat:0) // [0, 0, 0, 0, 0]
                The type argument <T, $IntLiteral> of VArray cannot be omitted.
  
  @Description:  1st, 2nd proposed example

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $..>

*/
import utils.assert.Assert
main() {
    let arr1: VArray<Int64 ,$5> = [1,2,3,4,5]
    let arr2: VArray<Int16 ,$0> = []
    Assert.equals(1, arr1[0])
    Assert.equals(2, arr1[1])
    Assert.equals(3, arr1[2])
    Assert.equals(4, arr1[3])
    Assert.equals(5, arr1[4])
    Assert.equals(0, arr2.size)
    0
}