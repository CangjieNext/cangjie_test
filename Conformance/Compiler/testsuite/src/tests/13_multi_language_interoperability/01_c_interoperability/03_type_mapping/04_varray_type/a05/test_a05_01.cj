/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a05_01

  @Level:         1

  @Assertion:   13.1.3.4(5) However, when the argument is passed, it is still passed as CPointer<T> .

  @Description:  Checks inout behavior for VArray argument to CFunc lambda.

  @Comment:      This assertion refines properties of VArray argument in CFunc invocation,
                see previous assertion for context.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077

*/
import utils.assert.Assert

let f1: CFunc<(VArray<Int8, $2>) -> Int8> = { arr => arr[0] + arr[1] }

main() {
    var v1: VArray<Int8, $2> = [2, 3]
    var v = unsafe{ f1(inout v1) }
    Assert.equals(5, v)
}
