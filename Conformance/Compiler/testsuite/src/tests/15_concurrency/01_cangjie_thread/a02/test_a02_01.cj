/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a02_01

  @Level:         1
  @Assertion:    15.1(2)  • Multiple threads execute concurrently.

  @Description:  Checks that 6 threads will run concurrently

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a02.cj

*/

main(): Int64 {
    test_body(6, 16 * 1024)
}
