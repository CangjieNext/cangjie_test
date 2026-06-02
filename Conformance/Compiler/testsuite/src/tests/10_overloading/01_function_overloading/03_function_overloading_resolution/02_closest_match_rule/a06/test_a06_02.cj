/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a06_02

  @Level:         1

  @Assertion:    10.1.3.2(6) The following are some examples of function overloading resolutions:    
  
  @Description:   Selected f2, as 3rd arg has type C3. C3 is heir of C2.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class C1 {}
open class C2 <: C1 {}
class C3 <: C2 {}
func f(a: C1, b: C2, c: C1) {
	Assert.fail()
} // f1
func f(a: C3, b: C3, c: C2) {} // f2

func f(a: C3, b: C2, c: C1) {
	Assert.fail()
} // f3

main() {
	//function call
	var x = f(C3(), C3(), C3()) // f2
}