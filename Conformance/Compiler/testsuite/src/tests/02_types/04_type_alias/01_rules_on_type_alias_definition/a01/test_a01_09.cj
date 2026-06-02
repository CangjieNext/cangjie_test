/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_01_a01_09

  @Level:         1

  @Assertion:    2.4.1(1) The type alias definition can only be defined at top-level.
 
  @Description:  Сheck that the type alias definition cannot be defined at the main function level

  @Mode:         compileonly

  @Negative:     yes

*/


main(): Unit {
    type AVeryLongAndUnintuitiveTypeName = Int64
}
