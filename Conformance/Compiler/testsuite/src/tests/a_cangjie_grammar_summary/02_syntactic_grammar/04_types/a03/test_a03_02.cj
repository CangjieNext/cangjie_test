/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a03_02

  @Level:         1
  @Assertion:   A.2.4(3)
                tupleType
                    : LPAREN NL* type (NL* COMMA NL* type)+ NL* RPAREN
                    ;
  @Description: Check tuple type with missed LPAREN
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single
*/


main() {
    var v1: Int16, Int64, Int8, IntNative)
    return 0
}
