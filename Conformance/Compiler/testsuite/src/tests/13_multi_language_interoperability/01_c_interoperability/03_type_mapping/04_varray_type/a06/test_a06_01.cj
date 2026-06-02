/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a06_01

  @Level:         1

  @Assertion:    13.1.3.4(6) If the parameter type in the CFunc signature is declared as CPointer<T> , 
  the corresponding argument can be an expression of the VArray<T, $N> type modified by inout. 
 
  @Description:  Check passing VArray to CPointer type parameter of Cangjie function.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077

*/
import utils.assert.Assert

@C func func_01(x: CPointer<Int64>, size: Int64): Int64 {
    var i = 0;
    var ret = 0;
    while (i < size) {
        ret += unsafe { x.read(i) }
        i++
    }
    return ret
}

main() {
    var a: VArray<Int64, $6> = [1, 2, 3, 3, 2, 1]
    let sum = unsafe { func_01(inout a, 6) }
    Assert.equals(12, sum)
}
