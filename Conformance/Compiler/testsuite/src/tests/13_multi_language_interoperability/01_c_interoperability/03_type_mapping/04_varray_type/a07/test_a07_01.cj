/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a07_01

  @Level:         1

  @Assertion:   13.1.3.4(7) When the argument is passed, it is still of type CPointer<T> .

  @Description:  Checks inout behavior for VArray argument to CFunc lambda.

  @Comment:      This assertion refines properties of VArray argument in CFunc invocation,
                see previous assertion for context.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077

*/
import utils.assert.Assert

let f1: CFunc<(CPointer<Int64>, Int64) -> Unit> = { x,size => 
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
