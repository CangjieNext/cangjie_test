/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a05_05

  @Level:         1

  @Assertion:       5.5(5) Lambda expressions cannot be marked with a return type; the compiler will perform type 
                    inference on the Lambda to determine the return type.

  @Description:     Check that compiler can infern lambda expressions returnn type.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    let f0 = {a: Int64, b: Int64 => a + b} 
}

struct myStruct {
    let f0 = {a: Int64, b: Int64 => a + b} 
}

main() {
    let f0 = {a: Int64, b: Int64 => a + b} 
    Assert.isTrue(f0 is (Int64,Int64) -> Int64)
    Assert.isTrue({ => "AA"} is () -> String)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.f0 is (Int64,Int64) -> Int64)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.f0 is (Int64,Int64) -> Int64)
}
