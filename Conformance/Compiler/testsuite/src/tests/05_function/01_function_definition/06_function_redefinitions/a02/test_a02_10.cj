/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_01_06_a02_10

  @Level:         1

  @Assertion:       5.1.6(2) Functions of the same name constitute redefinitions even if their return types differ.

  @Description:     Check that non-generic enum member functions with the same name and the same parameters list 
                    are considered to be redefined.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

enum myEnum {
    A 

    func myFunc(a: Int32): String {"${a}"}
    func myFunc(b: Int32): Rune {'C'}
}

main() {
}
