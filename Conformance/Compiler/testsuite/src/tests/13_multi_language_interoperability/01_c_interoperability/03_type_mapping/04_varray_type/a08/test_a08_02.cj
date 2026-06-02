/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a08_02

  @Level:         1

  @Assertion:    13.1.3.4(8) 
    CPointer<VArray<T, $N>> is equivalent to CPointer<T>. // spec bug: CPointer<VArray<T, $N>> != CPointer<T>
    foreign func foo1(a: VArray<Int32, $3>): Unit
    foreign func foo2(a: CPointer<Int32>): Unit
    var a: VArray<Int32, $3> = [1, 2, 3]
    unsafe {
    foo1(inout a) // Ok.
    foo2(inout a) // Ok.
    } 

 
  @Description:  Check passing CPointer<VArray<T, $N>> argument to CPointer<T>.parameter

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
  @Issue:        0006077

*/

import utils.assert.Assert

let f1: CFunc<(CPointer<VArray<Int64, $3>>, Int64) -> Unit> = { x,size => 
    var i = 0;
    while (i < size) {
        unsafe{ x.write(i, x.read(i) + i) }
        i++
    }
}

main() {
    var v1: VArray<Int64, $3> = [1, 2, 3]
    unsafe{ f1(inout v1, 3) }
    Assert.equals(1, v1[0])
    Assert.equals(3, v1[1])
    Assert.equals(5, v1[2])
}
