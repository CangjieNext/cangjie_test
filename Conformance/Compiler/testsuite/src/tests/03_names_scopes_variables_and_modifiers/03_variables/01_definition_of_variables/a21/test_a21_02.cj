/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a21_02

  @Level:         1

  @Comment:      It is a header of a list of assetions which include current assertion: 
                 In addition to the preceding syntax definitions, local variables may be introduced 
                 in the following scenarios:

  @Assertion:    3.3.1(21) Parameters in function and lambda definitions. For details, see Parameters.

  @Description:  Parameters in lambda definition

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    var myLambdaMult : (Int8, Int8) -> Int8 = {myLocalVar1, myLocalVar2 => myLocalVar1 * myLocalVar2}
    Assert.equals(myLambdaMult(2, 4), 8)

    var myLambdaConcat : (String, String) -> String = {
        myAnotherLocalVar, myAndOnceAgainLocalVar => myAnotherLocalVar + " " + myAndOnceAgainLocalVar
    }

    Assert.equals(myLambdaConcat("Hello", "World"), "Hello World")
    var myAgeToString : (Int32) -> String = {myAge => "My age is ${myAge}"}
    Assert.equals(myAgeToString(50), "My age is 50")
}