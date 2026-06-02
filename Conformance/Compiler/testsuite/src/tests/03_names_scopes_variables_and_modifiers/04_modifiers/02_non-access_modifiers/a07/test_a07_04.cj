/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a07_04

  @Level:         1

  @Assertion:    3.4.2(7) foreign indicates that the member is an external member, See Multi-language Interoperability
                 for details

  @Description:  Check that foreign functions must have return type

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

foreign func hw()

main() {
    return 0
}
