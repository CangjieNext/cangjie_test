/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a02_02

  @Level:         1

  @Assertion:       5.8.2(2) Types other than struct are prohibited from using the mut modifier when implementing 
                    functions of the interface.

  @Description:     Check that usage the mut modifier when implementing functions of the interface is prohibited
                    for class.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myInterface { 
    mut func myFunc(): String 
} 

class myClass <: myInterface { 
    public mut func myFunc(): String { " sadfsd " }
} 
 
main() { 
}
