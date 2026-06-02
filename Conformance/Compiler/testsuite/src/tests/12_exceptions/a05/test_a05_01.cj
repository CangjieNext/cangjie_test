/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_a05_01

  @Level:         1

  @Assertion:    12(5) Throw expressions start with the keyword throw and are followed by expressions.

  @Description:  Checks that throw keyword without expression after it causes a compile error.

  @Mode:         compileonly         

  @Negative:     yes

  @Structure:    single

*/

main() {
    throw
}
