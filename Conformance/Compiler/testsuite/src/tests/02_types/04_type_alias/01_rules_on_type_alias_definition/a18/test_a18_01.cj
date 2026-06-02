/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_04_01_a18_01

  @Level:         1

  @Assertion:   2.4.1(18) However, the access level of the alias cannot be higher than that of the original type.

  @Description: Сheck that the access level of the alias cannot be higher than that of the original type

  @Mode:        compileonly

  @Negative:    yes

*/

type AVeryLongAndUnintuitiveTypeName = Float16
public type SimpleType = AVeryLongAndUnintuitiveTypeName

main(): Unit {}
