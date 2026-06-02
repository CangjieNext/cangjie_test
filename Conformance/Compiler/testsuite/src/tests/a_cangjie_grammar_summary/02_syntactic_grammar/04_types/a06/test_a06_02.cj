/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a06_02

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
  @Description: Check Nothing type
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/
import utils.assert.Assert

main() {
    do { Assert.isTrue(break is Nothing) } while (false)
    do { Assert.isTrue(continue is Nothing) } while (false)
    return 0
}
