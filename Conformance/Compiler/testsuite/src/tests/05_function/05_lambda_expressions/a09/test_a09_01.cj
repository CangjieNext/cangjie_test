/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a09_01

  @Level:         1

  @Assertion:       5.5(9) • If no such context exists, the type of the expression on the right side of => is treated 
                    as the return type.

  @Description:     Check that return type of lambda expression can be treated from the right side of =>.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    var lambda1 = {a: Int32, b: Int32 => a + b} 
    var lambda2 = {a: Int32, b: Int32 => "${a} + ${b}"} 
    var lambda3 = {a: Int32, b: Int32 => } 
}

struct myStruct {
    var lambda1 = {a: Int32, b: Int32 => a + b} 
    var lambda2 = {a: Int32, b: Int32 => "${a} + ${b}"} 
    var lambda3 = {a: Int32, b: Int32 => } 
}

main() {
    var lambda1 = {a: Int32, b: Int32 => a + b} 
    Assert.isTrue(lambda1 is (Int32, Int32) -> Int32)
    var lambda2 = {a: Int32, b: Int32 => "${a} + ${b}"} 
    Assert.isTrue(lambda2 is (Int32, Int32) -> String)
    var lambda3 = {a: Int32, b: Int32 => } 
    Assert.isTrue(lambda3 is (Int32, Int32) -> Unit)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.lambda1 is (Int32, Int32) -> Int32)
    Assert.isTrue(myClassImpl.lambda2 is (Int32, Int32) -> String)
    Assert.isTrue(myClassImpl.lambda3 is (Int32, Int32) -> Unit)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.lambda1 is (Int32, Int32) -> Int32)
    Assert.isTrue(myStructImpl.lambda2 is (Int32, Int32) -> String)
    Assert.isTrue(myStructImpl.lambda3 is (Int32, Int32) -> Unit)
}
