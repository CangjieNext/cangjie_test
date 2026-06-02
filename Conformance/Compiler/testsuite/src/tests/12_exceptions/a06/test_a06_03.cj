/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_a06_03

  @Level:         1
  @Assertion:    12(6) The type of the expression after throw keyword must inherit from Exception or Error class.
  @Description:  Checks that the type of expression after throw keyword cannot be integer.
  @Mode:         compileonly         
  @Negative:     yes
  @Structure:    single

*/

main() : Int64 {
    throw 1
}
