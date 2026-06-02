/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a01_02

  @Level:         1

  @Assertion:       5.5(1) A Lambda expression is an expression that represents an anonymous function. 

  @Description:     Check that is is required to specify type of lambda expression.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

let myLambda: { _ => return "Hello" }

main() {

}
