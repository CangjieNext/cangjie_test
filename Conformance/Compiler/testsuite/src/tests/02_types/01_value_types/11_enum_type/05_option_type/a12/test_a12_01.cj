/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a12_01

  @Level:         1

  @Assertion:       2.1.11.5(12) 
 let number1 = opInt32_1.getOrThrow() // number1 = 100
 let number2 = opInt32_2.getOrThrow() // throw NoneValueException
 let number3 = opInt32_2.getOrThrow{ MyException("Get None value") } // throw MyException
 
  @Description:     Checks that positive examples behave as expected

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

let opInt32_1 = Some(100i32) // The type of 'opInt32_1' is 'Option<Int32>'
let opInt32_2 = Option<Int32>.None // The type of 'opInt32_2' is 'Option<Int32>'

class MyException <: Exception {
    MyException(var s: String) {}
}

main() {
    let number1 = opInt32_1.getOrThrow() // number1 = 100
    Assert.equals(100i32, number1)

    var check = 0;
    try {
        let number2 = opInt32_2.getOrThrow() // throw NoneValueException
      check = -1
    } catch(e : NoneValueException) {
        check = 1
    }
    Assert.equals(1, check)

    check = 0
    try {
        let number3 = opInt32_2.getOrThrow{ MyException("Get None value") } // throw MyException
      check = -1
    } catch(e : MyException) {
        Assert.equals("Get None value", e.s)
        check = 1
    }
    Assert.equals(1, check)
}
