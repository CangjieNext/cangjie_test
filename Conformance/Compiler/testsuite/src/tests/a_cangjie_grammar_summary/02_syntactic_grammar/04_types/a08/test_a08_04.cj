/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a08_04

  @Level:         1
  @Assertion:   A.2.4(8)
                userType
                    : (identifier NL* DOT NL*)* identifier ( NL* typeArguments)?
                    ;

  @Description: Check user type with missed required typeArguments
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single
*/

open class Class2<T> { }

main() {
    var v2: Class2

    return 0
}
