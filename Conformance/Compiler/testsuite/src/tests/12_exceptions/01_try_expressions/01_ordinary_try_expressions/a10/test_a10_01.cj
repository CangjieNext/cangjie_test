/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a10_01

  @Level:         1

  @Assertion:    12.1.1(10) 3. A finally block starts with the keyword finally, and is followed by a block consisting
                               of expressions and declarations.

  @Description:  Checks the finally block without {}.

  @Mode:         compileonly        

  @Negative:     yes

  @Structure:    single

*/

main() {
    try {
    } finally
}
