/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a06_03

  @Level:         1
  @Assertion:   A.2.4(6)
                charLangTypes
                    : numericTypes
                    | CHAR
                    | BOOLEAN
                    | Nothing
                    | UNIT
                    | THISTYPE
                    ;
  @Description: Check various char lang types as variable type
  @Comment:     Auto-generated tests by gen_types_tests_a06.py with seed = 1.
                The numericTypes was skipped because they checked in A.2.4(7)
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
  
    var `E_3Fy`: Rune = r'л'
    Assert.equals(r'л', `E_3Fy`)

    var `Z`: Bool = false
    Assert.equals(false, `Z`)

  return 0
}
