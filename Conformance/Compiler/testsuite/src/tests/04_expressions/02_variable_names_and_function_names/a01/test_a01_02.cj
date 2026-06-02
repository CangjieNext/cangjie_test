/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a01_02

  @Level:         1

  @Assertion: 4.2(1) The variable name and the function name themselves
              (including variables or functions referred to by package
              names) are also expressions.
  @Description: Checks that function names are expressions.
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

main() {
    func internal_empty() {}

    func internal_with_params(i: Int64, j: Int32, name: String) {}

    func internal_with_return(): Int64 {
        -1
    }

    func internal_generic<T>() {}

    func internal_complex<T1, T2, T3>(a: T1, b: T2, c: T3): T3 {
        c
    }

    empty
    with_params
    with_return
    generic<Int32>
    complex<Int32, Int64, String>
    
    internal_empty
    internal_with_params
    internal_with_return
    internal_generic<Int32>
    internal_complex<Int32, Int64, String>

    return
}
