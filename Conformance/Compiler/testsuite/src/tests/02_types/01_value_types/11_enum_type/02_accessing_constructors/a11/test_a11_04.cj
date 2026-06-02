/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a11_04

  @Level:         1

  @Assertion:       2.1.11.2(11) When an enum constructor conflicts with other names (variable names, type names), 
  neither the enum constructor nor the conflicting name can be used directly; 
  it must be used in a prefix-qualified manner.

  @Description:     Checks that conflicting types and enum constructors can not be used w/o prefix

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

enum A {
    | B
    | C(Bool)
    | S
    | T(Int64)
}

interface B {}
class C <: B {}
struct S {
  S(var a!: T = A.T(10)) {}
}
type T = A

func F(b:B,c:C) {}

var a = (A.B, A.C(true), A.S, A.T(0))

main() {
    var x = (a is (A, A, A, A))
    var y = (F is (B, C)->Unit)

    var u = S(a:a[0])
    match (u.a) {
      case A.B => ()
      case _ => ()
    }
    return 0
}
