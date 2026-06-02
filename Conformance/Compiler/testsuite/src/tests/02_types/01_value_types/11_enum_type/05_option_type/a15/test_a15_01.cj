/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a15_01

  @Level:         1

  @Assertion:       2.1.11.5(15) 
let number1 = opInt32_1 ?? 0 // number1 = 100
 let number2 = opInt32_2 ?? 0 // number2 = 0
 
  @Description:     Checks that positive examples behave as expected

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

let opInt32_1 = Some(100i32) // The type of 'opInt32_1' is 'Option<Int32>'
let opInt32_2 = Option<Int32>.None // The type of 'opInt32_2' is 'Option<Int32>'

main() {
    let number1 = opInt32_1 ?? 0 // number1 = 100
    let number2 = opInt32_2 ?? 0 // number2 = 0
    Assert.equals(100i32, number1)
    Assert.equals(0, number2)
}
