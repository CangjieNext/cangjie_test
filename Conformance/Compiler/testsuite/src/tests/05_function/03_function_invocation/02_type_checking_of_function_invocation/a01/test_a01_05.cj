/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a01_05

  @Level:         1

  @Assertion:       5.3.2(1) If the invoked function involves overloading, then the overload resolution rules are 
                    applied according to Function Overloading.

  @Description:     Check that invoking of overloaded functions with the wrong context will produce an error: global 
                    function.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

var myTopInt64Var: Int64 = 12

func myFunc(a: Int64): Int64 { a - 1 }
func myFunc(a: Int32): Int32 { a + 1 }

main() {
    var myVar: Int32 = myFunc(myTopInt64Var)
}
