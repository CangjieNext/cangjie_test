/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_005

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that an expression cannot consist of two operands 
                without operator. Test integer literals.
  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @CompileWarning: Ignore

*/

main() {
    1 2
    return
}
