/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a08_03

  @Level:         1

  @Assertion:       5.3.3(8) This means that the following two call examples are not legal. 
                    func f(): (()->Unit)->Unit { 
                        {a => } 
                    } 
                    f() {} // error, the lambda expression is not argument for f. 

                    func g(a: ()->Unit) {} 
                    if (true) { g } else { g } () {} // error, illegal trailing closure syntax 
                    The above expression must be assigned to the variable first, and the trailing closure syntax can 
                    only be used when called with the variable name ss shown in the following code. 
                    let f2 = f() 
                    f2 {} // ok 
                    let g2 = if (true) { g } else { g } 
                    g2() {} // ok 
 
  @Description:     Negative example from spec

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @CompileWarning:  ignore

  @Issue:           6289

*/

func g(a: ()->Unit) {}

main() {
    if (true) { g } else { g } () {} // error, illegal trailing closure syntax
}
