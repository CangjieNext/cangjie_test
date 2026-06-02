/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a06_03

  @Level:         1

  @Assertion:       5.7.1(6) The parameter types of the four functions in the following example are the same: 
                    type Boolean = Bool 
                    func f(a : Bool) {} 
                    func f(a! : Bool) {} 
                    func f(a! : Bool = false) {} 
                    func f(a! : Boolean) {} 

  @Description:     Negative examples from spec

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

type Boolean = Bool 
func f(a : Bool) {} 
func f(a! : Boolean) {} 

main() {
}
