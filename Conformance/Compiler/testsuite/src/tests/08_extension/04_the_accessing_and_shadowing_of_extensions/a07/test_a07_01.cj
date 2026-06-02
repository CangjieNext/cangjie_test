/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a07_01

  @Level:         1

  @Assertion:       8.4(7) Extensions are not allowed to shadow any member of the type being extended.

  @Description:     Check that extended type instance member can't shadow member of the type being extended: 
                    type member.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

type MyType = Int32

extend MyType {
    func toString() { "AAA" }
}

main(): Unit { } 
