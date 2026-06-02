/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a03_01

  @Level:         1

  @Assertion: 4.2(3) For a function name, its value is a closure (see Section 
              5.7), and its type is the corresponding function type.
  @Description: Checks that for a function name, its value is a closure, and 
                its type is the corresponding function type. 
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func empty() {}

func with_params(i: Int64, j: Int32, name: String) {}

func with_return(): Int64 {
    Assert.getRuntimeZero()
}

func generic<T>(): Int64 {
    1
}

func complex<T1, T2, T3>(a: T1, b: T2, c: T3): T3 {
    c
}

func checkSimpleClosure(f: () -> Unit) {
    f()
}

main() {
    Assert.isTrue(empty is () -> Unit)
    Assert.isTrue(with_params is (Int64, Int32, String) -> Unit)
    Assert.isTrue(with_return is () -> Int64)
    Assert.isTrue(generic<Int8> is () -> Int64)
    Assert.isTrue(complex<Int8, Int16, Int32> is (Int8, Int16, Int32) -> Int32) 

    // Seems like there is no way to compare two closures, so all that can be
    // done here is to assign function name value to the variable of the 
    // corresponding closure type.

    var c1: () -> Unit = empty
    var c2: (Int64, Int32, String) -> Unit = with_params
    var c3: () -> Int64 = with_return
    var c4: () -> Int64 = generic<Int64>
    var c5: (Int8, Int16, Int32) -> Int32 = complex<Int8, Int16, Int32>

    return
}

