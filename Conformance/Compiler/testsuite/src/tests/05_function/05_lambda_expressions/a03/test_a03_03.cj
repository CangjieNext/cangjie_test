/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a03_03

  @Level:         1

  @Assertion:       5.5(3) There are two forms of lambda expressions, {a: Int64 => e1; e2 } with a formal parameter 
                    and { => e1; e2 } without a formal parameter (e1 and e2 are expressions or sequences of 
                    declarations)

  @Description:     Check that lambda expression can't be defined without =>.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

main() {

    var myLambda1: ()->Int32 = { 123 } 

}
