/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a01_06

  @Level:         1

  @Assertion:       5.8.1(1) Mut functions are modified with the mut keyword, are only allowed to be defined in the 
                    interface, struct and struct extensions, and can only act on instance member functions (static 
                    member functions are not supported). 

  @Description:     Check that class member function can't be defined as mut.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

class myClass { 
    var myVar: Int64 = 10
    mut func myIncrementFunc(): Unit {
        this.myVar += 1
    }
}

main() {
} 
