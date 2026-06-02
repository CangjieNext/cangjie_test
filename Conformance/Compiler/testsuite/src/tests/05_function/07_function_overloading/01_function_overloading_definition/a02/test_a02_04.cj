/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a02_04

  @Level:         1

  @Assertion:       5.7.1(2) Overloaded functions must comply with the following rules: 
                    • The function name must be the same and one of the following conditions must be met: 
                        – Function names introduced by the keyword func. 

  @Description:     Check that overloading is not available for objects with the same name and introduced by the 
                    keyword  different from 'func': struct.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

struct myStruct {
    public func myFunc(a: Int16) { a + 1 }
}

struct myStruct {
    public func myFunc(a: Int32) { a + 1 }
}

main() {
}
