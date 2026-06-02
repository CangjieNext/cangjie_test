/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_04_a05_02

  @Level:         1

  @Assertion:    13.1.4(5) In addition, the CType interface cannot be inherited,
                 implemented explicitly or extended. 

  @Description:  Check if CType can be implemented explicitly.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

class ABC <: CType {}

main() {
}
