/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a10_01

  @Level:         1

  @Assertion:       5.5(10) The type annotation of parameters in Lambda expressions can be defaulted, and the 
                    compiler will try to infer the type from the context, and will report an error when the 
                    compiler cannot infer the type.

  @Description:     Check that if annotation of parameters in Lambda expressions is omited, compiler can infer 
                    types from context.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert


class myClass {
    var lambda0: (Int32, Float16) -> Unit  = {a, b => } 
    var lambda1: (Int32, Int32) -> Int32 = {a, b: Int32 => a + b} 
    var lambda2: (Rune, Bool) -> String = {a, b => "${a} + ${b}"} 
}

struct myStruct {
    var lambda0: (Int32, Float16) -> Unit  = {a, b => } 
    var lambda1: (Int32, Int32) -> Int32 = {a: Int32, b => a + b} 
    var lambda2: (Rune, Bool) -> String = {a, b => "${a} + ${b}"} 
}


main() {
    var lambda0: (Int32, Float16) -> Unit  = {a, b => } 
    Assert.isTrue(lambda0 is (Int32, Float16) -> Unit)
    var lambda1: (Int32, Int32) -> Int32 = {a, b => a + b} 
    Assert.isTrue(lambda1 is (Int32, Int32) -> Int32)
    Assert.equals(12, lambda1(7, 5))
    var lambda2: (Rune, Bool) -> String = {a, b => "${a} + ${b}"} 
    Assert.isTrue(lambda2 is (Rune, Bool) -> String)
    Assert.equals("F + false", lambda2(r'F', false))

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.lambda0 is (Int32, Float16) -> Unit)
    Assert.isTrue(myClassImpl.lambda1 is (Int32, Int32) -> Int32)
    Assert.equals(12, myClassImpl.lambda1(7, 5))
    Assert.isTrue(myClassImpl.lambda2 is (Rune, Bool) -> String)
    Assert.equals("F + false", myClassImpl.lambda2(r'F', false))

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.lambda0 is (Int32, Float16) -> Unit)
    Assert.isTrue(myStructImpl.lambda1 is (Int32, Int32) -> Int32)
    Assert.equals(12, myStructImpl.lambda1(7, 5))
    Assert.isTrue(myStructImpl.lambda2 is (Rune, Bool) -> String)
    Assert.equals("F + false", myStructImpl.lambda2(r'F', false))
}
