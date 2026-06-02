/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a02_02

  @Level:         1
  @Assertion:    2.2.1(2) Arrays are used to store a sequence of values of the
                 same type (or has a common super type).

  @Description:  Checks that Array can be created of values of type having a
                 common super type

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: ../array_commons.cj

  @Issue:        0006496

*/
import array_commons.*

main(): Int64 {
    let a5 = [C1(), C2(), C3()]

    return 0
}
