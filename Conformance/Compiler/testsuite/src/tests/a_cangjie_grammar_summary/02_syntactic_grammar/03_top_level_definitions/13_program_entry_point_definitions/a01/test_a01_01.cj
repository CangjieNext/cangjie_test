/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_13_a01_01

  @Level:         1
  @Assertion:   A.2.3.13(1)
                mainDefinition
                    : MAIN
                      NL* functionParameters
                      (NL* COLON NL* type)?
                      NL* block
                    ;

  @Description: Check trivial main definition.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main

()

:

Int8

{
    return 0
}