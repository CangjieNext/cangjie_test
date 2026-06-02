/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_08

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that a members expanded from macros are members of the class, i.e:
                1. non-private members can be accessed outside the class 
                   through a class instance for instance members and through the class type
                   for static members
                2. all members can be accessed directly by name inside the class
                3. members can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006136, 0006124

  @Comment: All the preceding are: 
            static initializer
            primary constructor
            constructors
            member variables
            member functions and member operator functions
            member properties
            macro expressions

*/

import utils.assert.Assert

import ml.*

var indicator = 0

class Test {
  private static let test_var = -1
  @PrivateStaticVar[a](1)
  @PrivateStaticLet[b](2)
  @ProtectedStaticVar[c](3)
  @ProtectedStaticLet[d](4)
  @StaticVar[e](5)
  @StaticLet[f](6)

  @PrivateVar[g](7)
  @PrivateLet[h](8)
  @ProtectedVar[i](9)
  @ProtectedLet[j](10)
  @Var[k](11)
  @Let[l](12)

  @PrivateStaticFunc[f1](1)
  @PrivateStaticFuncGeneric[f2](2)
  @ProtectedStaticFunc[f3](3)
  @ProtectedStaticFuncGeneric[f4](4)
  @StaticFunc[f5](5)
  @StaticFuncGeneric[f6](6)

  @PrivateFunc[f7](7)
  @PrivateFuncGeneric[f8](8)
  @ProtectedFunc[f9](9)
  @ProtectedFuncGeneric[f10](10)
  @Func[f11](11)
  @FuncGeneric[f12](12)

  @PrivateStaticMutProp[pa](1)
  @PrivateStaticProp[pb](2)
  @ProtectedStaticMutProp[pc](3)
  @ProtectedStaticProp[pd](4)
  @StaticMutProp[pe](5)
  @StaticProp[pf](6)

  @PrivateMutProp[pg](7)
  @PrivateProp[ph](8)
  @ProtectedMutProp[pi](9)
  @ProtectedProp[pj](10)
  @MutProp[pk](11)
  @Prop[pl](12)

  @OperatorBinary[+](1)
  @OperatorBinary[-](2)
  @OperatorBinary[/](3)
  @OperatorBinary[*](4)

  @OperatorUnary[!](5)
  @OperatorUnary[-](6)

  @PrimaryConst(Test)
  @InitConst(param)

  @StaticInit(Test)

  func check() {
    Assert.equals(1, a)
    Assert.equals(2, b)
    Assert.equals(3, c)
    Assert.equals(4, d)
    Assert.equals(5, e)
    Assert.equals(6, f)
    Assert.equals(7, g)
    Assert.equals(8, h)
    Assert.equals(9, i)
    Assert.equals(10, j)
    Assert.equals(11, k)
    Assert.equals(12, l)

    Assert.equals(1, f1())
    Assert.equals(2, f2<Unit>())
    Assert.equals(3, f3())
    Assert.equals(4, f4<String>())
    Assert.equals(5, f5())
    Assert.equals(6, f6<Rune>())
    Assert.equals(7, f7())
    Assert.equals(8, f8<Int64>())
    Assert.equals(9, f9())
    Assert.equals(10, f10<Bool>())
    Assert.equals(11, f11())
    Assert.equals(12, f12<(Object)>())

    Assert.equals(1, pa)
    Assert.equals(2, pb)
    Assert.equals(3, pc)
    Assert.equals(4, pd)
    Assert.equals(5, pe)
    Assert.equals(6, pf)
    Assert.equals(7, pg)
    Assert.equals(8, ph)
    Assert.equals(9, pi)
    Assert.equals(10, pj)
    Assert.equals(11, pk)
    Assert.equals(12, pl)
  }
}

main() {
  Assert.equals(10, indicator)

  Assert.equals(3, Test.c)
  Assert.equals(4, Test.d)
  Assert.equals(5, Test.e)
  Assert.equals(6, Test.f)

  Assert.equals(3, Test.f3())
  Assert.equals(4, Test.f4<Unit>())
  Assert.equals(5, Test.f5())
  Assert.equals(6, Test.f6<Any>())

  Assert.equals(3, Test.pc)
  Assert.equals(4, Test.pd)
  Assert.equals(5, Test.pe)
  Assert.equals(6, Test.pf)

  let test = Test()
  Assert.equals(11, indicator)

  Assert.equals(9, test.i)
  Assert.equals(10, test.j)
  Assert.equals(11, test.k)
  Assert.equals(12, test.l)

  Assert.equals(9, test.f9())
  Assert.equals(10, test.f10<Option<Object>>())
  Assert.equals(11, test.f11())
  Assert.equals(12, test.f12<Rune>())

  Assert.equals(9, test.pi)
  Assert.equals(10, test.pj)
  Assert.equals(11, test.pk)
  Assert.equals(12, test.pl)

  test.check()

  let lhs = Test()
  let rhs = Test()
  Assert.equals(13, indicator)
  Assert.equals(1, lhs + rhs)
  Assert.equals(2, lhs - rhs)
  Assert.equals(3, lhs / rhs)
  Assert.equals(4, lhs * rhs)
  Assert.equals(5, !lhs)
  Assert.equals(6, -rhs)

  let test_init = Test(1)
  Assert.equals(14, indicator)
}
