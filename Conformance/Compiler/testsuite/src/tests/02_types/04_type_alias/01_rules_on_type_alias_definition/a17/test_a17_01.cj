/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_04_01_a17_01

  @Level:         1

  @Assertion:   2.4.1(17) It should be noted that the alias can have a different accessibility from the original type.

  @Description: Check that the alias can have a different accessibility from the original type

  @Mode:        compileonly

  @Negative:    no

*/

public type AVeryLongAndUnintuitiveTypeName = Float64
type SimpleType = AVeryLongAndUnintuitiveTypeName

main(): Unit {}
