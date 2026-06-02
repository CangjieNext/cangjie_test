/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a08_02

  @Level:         1
  @Assertion:   A.2.4(8)
                userType
                    : (identifier NL* DOT NL*)* identifier ( NL* typeArguments)?
                    ;

  @Description: Check user type from other package
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_test_a08_02.cj
*/

import package11

main() {
    var v1: package11.Class1
    var v2: package11.Class2<IntNative>
    var v3: package11.I1
    var v4: package11.MyType
    var v5: package11.S1
    var v6: package11.HandGame

    return 0
}
