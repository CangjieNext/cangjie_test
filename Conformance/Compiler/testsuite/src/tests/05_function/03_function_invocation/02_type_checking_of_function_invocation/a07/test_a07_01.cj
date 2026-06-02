/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a07_01

  @Level:         1

  @Assertion:       5.3.2(7)
                    open class Base {} 
                    class Sub <: Base {} 
                    func f(a: Sub) {1}  // f1 
                    func f(a: Base) {Base()}          // f2 
                    let x: Base = f(Sub())         // f2 can pass the type checking 

  @Description:     Positive example from spec. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

var myVar: Int64 = 1

open class Base {} 
class Sub <: Base {} 
func f(a: Sub) {myVar}  // f1 
func f(a: Base) {Base()}          // f2 

main() {
    Assert.isTrue(Sub() is Base)
    Assert.isTrue(f(Sub()) is Int64)
    Assert.isTrue(f(Base()) is Base)
    let x: Base = f(Sub())         // f2 can pass the type checking 
}
