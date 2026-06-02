/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a04_02

  @Level:         1
  @Assertion:    2.2.1(4) The length of arrays are fixed. That is, once an
                 array is initialized, its length cannot be changed.

  @Description:  Checks that Array length can't be changed

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

main(): Int64 {
    let a1 = [0, 1, 2]

    a1[3] = 5

    return 0
}
