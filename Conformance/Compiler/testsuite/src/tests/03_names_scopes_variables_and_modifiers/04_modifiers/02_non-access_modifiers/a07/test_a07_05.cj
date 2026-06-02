/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a07_05

  @Level:         1

  @Assertion:    3.4.2(7) foreign indicates that the member is an external member, See Multi-language Interoperability
                 for details

  @Description:  Check that foreign functions cannot be declared inside classes.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

class C {
    foreign func hw(): Unit
}

main() {
    return 0
}
