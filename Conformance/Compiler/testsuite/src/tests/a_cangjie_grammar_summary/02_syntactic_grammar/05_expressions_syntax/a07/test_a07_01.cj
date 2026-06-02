/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_05_a07_01

  @Level:         1
  @Assertion:   A.2.5(7) 
                unitLiteral
                    : LPAREN NL* RPAREN
                    ;

  @Description: Check various unit types as variable type
  @Comment:     Auto-generated tests by gen_types_tests_a06.py with seed = 1.
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
  
    Assert.isTrue((


) is Unit)

    Assert.isTrue(() is Unit)

    Assert.isTrue((









) is Unit)

    Assert.isTrue((


) is Unit)

    Assert.isTrue((





) is Unit)

    Assert.isTrue((







) is Unit)

    Assert.isTrue((





) is Unit)

    Assert.isTrue((









) is Unit)

    Assert.isTrue((









) is Unit)

    Assert.isTrue((



) is Unit)

  return 0
}
