/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a08_03

  @Level:         1
  @Assertion:   A.2.4(8)
                userType
                    : (identifier NL* DOT NL*)* identifier ( NL* typeArguments)?
                    ;

  @Description: Check user type from other package with missed DOT
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   complex-main
  @Dependencies: aux_test_a08_02.cj
*/

import package11.*

main() {
    var v1: package11 Class1
    return 0
}