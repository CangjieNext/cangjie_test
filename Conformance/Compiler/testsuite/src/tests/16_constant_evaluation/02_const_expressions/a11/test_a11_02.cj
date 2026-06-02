
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
  @Name:     16_02_a11_02

  @Level:         1

  @Assertion:   16.2(11) The expressions within these expressions must all be const expressions.
  @Description: Check that an if-else-expression cannot be const if it contains a non-const expression.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

func f() { }

main() {
    const cond = true
    const cIf = if (cond) {
        
    } else {
        f()
    }
    return 0
}
