/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a07_02

  @Level:         1

  @Assertion:    12.1.1(7) Each catch block starts with the keyword catch, followed by a (catchPattern) and a block
                           of expressions and declarations.

  @Description:  Checks that the catch-blocks has to start with catch keyword.

  @Mode:         compileonly         

  @Negative:     yes

  @Structure:    single

*/

main() {
    try {
    } (e: E1) {)
}
