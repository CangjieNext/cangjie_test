/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a07_02

  @Level:         1

  @Assertion:    3.4.2(7) foreign indicates that the member is an external member, See Multi-language Interoperability
                 for details

  @Description:  Check that functions with foreign can be declared without usage

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

foreign func hw(): Unit

main() {
    return 0
}
