/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a04_02

  @Level:         1

  @Assertion:       5.3.2(4) 2 Type checking based on the arguments in the call expression and the return type Tr 
                    specified in the context of the call expression. 

  @Description:     Check that if no functions pass type checking based on the arguments in the call expression - an 
                    error will be raised.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/
func myFunc(a: Int16): Int16 { a + 1 }
func myFunc(a: Int32): Int32 { a + 1 }
func myFunc(a: Int64): Int64 { a + 1 }

main() {
    var myVar = myFunc("SSS")
    0
}
