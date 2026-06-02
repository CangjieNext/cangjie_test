/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a07_03

  @Level:         1

  @Assertion:    2.3.1(7) For type safety, the Cangjie programming language does not support implicit type
                 conversion between numeric types.

  @Description:  Check that the implicit type conversion between Int8 & Float16 not supported

  @Mode:         compileonly

  @Negative:     yes

*/

main(): Unit {
    var c: Float16 = 89_i8
}
