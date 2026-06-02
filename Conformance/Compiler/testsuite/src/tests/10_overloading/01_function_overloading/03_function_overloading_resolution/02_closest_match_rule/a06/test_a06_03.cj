/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a06_03

  @Level:         1

  @Assertion:    10.1.3.2(6) The following are some examples of function overloading resolutions:    
  
  @Description:  Emit error, as it was not found needed function for call

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


open class A {}
class B <: A {}
func foo<X>(a: X, b: X): Int32 {
} // foo1
func foo(a: A, b: B): Int32 {
} // foo2
func foo<X>(a: A, b: X): Int32 {
	return Int32(0)
} // foo3

main() {
	foo(A(), A()) // Error: cannot resolve.
}