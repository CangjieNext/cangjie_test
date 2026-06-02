/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a05_01

  @Level:         1

  @Assertion:       2.1.11.5(5) For example, the following definition is legal. 
 let v1: ?Int64 = 100
 let v2: ??Int64 = 100

 
  @Description:     Checks that positive examples compile

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

 let v1: ?Int64 = 100
 let v2: ??Int64 = 100

main() {
}
