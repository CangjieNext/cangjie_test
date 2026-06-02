/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a13_01

  @Level:         1
  @Assertion:   A.2.5(13)
                numericTypeConvExpr
                    : numericTypes LPAREN NL* expression NL* RPAREN
                    ;

  @Description: Check trivial numeric type conversion expressions.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

main() {
    Int16(1 - 2)
    Int8(0b0101 | 0b1010)
    Int32(213_u16)

    Float16(1.0/3.0)
    Float64(Float32(1.0f16/0.0f16))

    return 0
}
