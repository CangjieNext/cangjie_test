/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a10_01

  @Level:         1

  @Assertion:       2.1.11.2(10) 
 package p
 enum E {
  | f(Int64)
  | f(Int64, Int64, Int64)
 }
 func f(a: Int64) {}
 func f(a: Int64, b: Int64) {}
 func g() {
  f(1) // error
  p.f(1) // ok
  E.f(1) // ok
  f(1, 2) // ok, find f(a: Int64, b: Int64)
  f(1, 2, 3) // ok, find E.f(Int64, Int64, Int64)
 } 

  @Description:     Checks that positive examples do compile

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/
package p

enum E {
    | f(Int64)
    | f(Int64, Int64, Int64)
}
func f(a: Int64) {}
func f(a: Int64, b: Int64) {}
func g() {
    f(1) // ok
    E.f(1) // ok
    f(1, 2) // ok, find f(a: Int64, b: Int64)
    E.f(1, 2, 3) // ok, find E.f(Int64, Int64, Int64)
} 

main() {
}
