/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a07_03

  @Level:         1

  @Assertion:    2.1.6.2(7) If the $ in the string is not followed by { , it should be treated as normal $ character.

  @Description:  Check that combination of "$" usage with single "{" inside multy-line literal produce an error.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

main() {
  let mySimpleExpression = """
  ${ 2+3 """
}