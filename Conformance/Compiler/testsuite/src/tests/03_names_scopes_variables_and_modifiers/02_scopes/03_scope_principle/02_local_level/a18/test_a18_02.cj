/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a18_02

  @Level:         1

  @Assertion:    3.2.3.2(18) The scope of the parameters of lambda expressions is similar to that of function 
                 parameters. For instance, their scope level is the same as the variables defined in the body 
                 of the lambda expression.

  @Description:  Check that the scope of lambda expression arguments ends with the closing of the lambda body.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    var y : Bool = false
    let foo : (Bool) -> Unit = { y : Bool =>
        let yy = true
    }

    foo(false)
    y = yy 
}
