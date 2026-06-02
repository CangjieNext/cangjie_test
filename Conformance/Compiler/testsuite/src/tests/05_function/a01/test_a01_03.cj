/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_a01_03

  @Level:         1

  @Assertion:     5(1) A function is a block of program code that deals with a specific task.
A function can be identified and invoked through a name.

  @Description:   Check that function can't be declared w/o identifier.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func (a:Int32){
  a*2
}
main() {
}
