
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of a list item paragraph:
                "The following expressions are all const expressions.
                ...
                8.if, match, try, control transfer expressions (including return, break, continue, throw), is, as. The
                expressions within these expressions must all be const expressions."
  @Name:     16_02_a11_07

  @Level:         1

  @Assertion:   16.2(11) The expressions within these expressions must all be const expressions.
  @Description: Check that a match expression cannot be const if there's a `case e` where e is not const.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6614

*/

func f() { 1 }

main() {
    const c = 1
    const x = match (c) {
        case f() => "1"
        case _ => "0"
    }
    return 0
}
