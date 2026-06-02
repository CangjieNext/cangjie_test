/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_04_a03_01

  @Level:         1

  @Assertion:    13.1.3.4(3) VArray is allowed to be used as parameter type of CFunc signatures,
  but not allowed as return type. 
 
  @Description:  Check VArray is accepted as parameter type of CFunc signatures.

  @Mode:         run

  @Negative:     no

  @Structure:    single
  @Issue:        0006077


*/
import utils.assert.Assert

let f1: CFunc<(VArray<Int8, $1024>) -> Int64> = { arr => arr.size }
@C foreign func func_02(x: CFunc<(VArray<Int8, $1024>) -> Int64>, arg: CPointer<Int8>): Int64

main() {
    var arr = VArray<Int8, $1024>(repeat: 0)
    var Value = unsafe { func_02(f1, inout arr) }
    Assert.equals(1024, Value)
}
