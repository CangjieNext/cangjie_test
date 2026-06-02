/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a10_02

  @Level:         1

  @Assertion:     5.1(10) The return type of the function can be declared explicitly using the syntax of : type 
                  following the parameters. Alternatively, it can be omitted and inferred by the compiler.

  @Description:   Check that function defined w/o return type but inferred as Type1 can't be assigned to variable 
                  defined as Type2:
                  Type1 is String, Type2 is Int32

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myFunc(){
  "func ret val"
}
main() {
  var myVar:Int32 = myFunc()
}
