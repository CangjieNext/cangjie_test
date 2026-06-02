/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a05_02

  @Level:         1

  @Assertion:       5.8.3(5) Non-mut instance member functions (including lambda expressions) cannot access mut 
                    functions of this, and vice versa. 

  @Description:     Check that mut instance member functions are not accessible from non-mut instance member: 
                    interface members.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myI { 
    func funcNotMut(): Bool { !funcMut() }
    mut func funcMut(): Bool { true } 
} 

main() {
}
