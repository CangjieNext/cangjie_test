/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_12_03_a02_01

  @Level:         1

  @Assertion:    2.1.12.3(2)
                 let arr9: VArray<Int64, $6> = [0, 1, 2, 3, 4, 5]
                 let size = arr9.size // size = 6

  @Description:  Test from proposed example

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:       0006077

  @Comment:     Compiler emit error on VArray<..., $..>

*/


import utils.assert.Assert


main() {
    let arr9: VArray<Int64, $6> = [0, 1, 2, 3, 4, 5]
    let size = arr9.size // size = 6
    Assert.equals(6, size)
    0
}