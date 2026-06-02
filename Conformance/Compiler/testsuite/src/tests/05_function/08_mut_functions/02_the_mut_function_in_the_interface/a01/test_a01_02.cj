/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a01_02

  @Level:         1

  @Assertion:       5.8.2(1) struct types must maintain the same mut modifier when implementing functions of the 
                    interface. 

  @Description:     Check that unimplemented mut interface function must be implemented on inheritance.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface myInterface { 
    mut func f0(): Unit 
} 

struct myStruct <: myInterface {
    public var myVar: Int64 = 10
}

main() { 
}
