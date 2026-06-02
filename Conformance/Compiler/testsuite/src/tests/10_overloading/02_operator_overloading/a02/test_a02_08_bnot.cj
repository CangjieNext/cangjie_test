/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a02_08_bnot

  @Level:         1

  @Assertion:    10.2(2) By default, the type of operands for an operator can only
                 be of specific types, e.g., the operand of an arithmetic operator
                 can only be numeric types, and the operand of a logical operator 
                 can only be of Booltype.

  @Description:  Logical negation is applied to integer. Must be error.
                 However program is executing and emit correct result. -1.
                 Is it OK ?

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006478

*/


main(ina :Array<String>) {
    print(!0)
}
