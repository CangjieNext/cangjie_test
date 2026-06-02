/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a04_01

  @Level:         1

  @Assertion:    14.2.2(4) The parentheses can contain any valid tokens, but cannot be empty.

  @Description:  Check that the parentheses can contain any valid tokens
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

  @Issue:       0006078

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @stub(.)
    @stub(,)
    @stub(\()
    @stub(\))
    @stub([)
    @stub(])
    @stub({)
    @stub(})
    @stub(**)
    @stub(*)
    @stub(%)
    @stub(/)
    @stub(+)
    @stub(-)
    @stub(|>)
    @stub(~>)
    @stub(++)
    @stub(--)
    @stub(&&)
    @stub(||)
    @stub(!)
    @stub(&)
    @stub(|)
    @stub(^)
    @stub(<<)
    @stub(>>)
    @stub(:)
    @stub(;)
    @stub(=)
    @stub(+=)
    @stub(-=)
    @stub(*=)
    @stub(**=)
    @stub(/=)
    @stub(%=)
    @stub(&&=)
    @stub(||=)
    @stub(&=)
    @stub(|=)
    @stub(^=)
    @stub(<<=)
    @stub(>>=)
    @stub(->)
    @stub(=>)
    @stub(...)
    @stub(..=)
    @stub(..)
    @stub(\@)
    @stub(?)
    @stub(<:)
    @stub(<)
    @stub(>)
    @stub(<=)
    @stub(>=)
    @stub(!=)
    @stub(==)
    @stub(_)
    @stub($)
    @stub(Int8)
    @stub(Int16)
    @stub(Int32)
    @stub(Int64)
    @stub(UInt8)
    @stub(UInt16)
    @stub(UInt32)
    @stub(UInt64)
    @stub(Float16)
    @stub(Float32)
    @stub(Float64)
    @stub(Rune)
    @stub(Bool)
    @stub(Unit)
    @stub(Nothing)
    @stub(struct)
    @stub(enum)
    @stub(This)
    @stub(package)
    @stub(import)
    @stub(class)
    @stub(interface)
    @stub(func)
    @stub(let)
    @stub(var)
    @stub(type)
    @stub(init)
    @stub(this)
    @stub(super)
    @stub(if)
    @stub(else)
    @stub(case)
    @stub(try)
    @stub(catch)
    @stub(finally)
    @stub(for)
    @stub(do)
    @stub(while)
    @stub(throw)
    @stub(return)
    @stub(continue)
    @stub(break)
    @stub(as)
    @stub(in)
    @stub(!in)
    @stub(match)
    @stub(from)
    @stub(where)
    @stub(extend)
    @stub(spawn)
    @stub(synchronized)
    @stub(macro)
    @stub(quote)
    @stub(true)
    @stub(false)
    @stub(sealed)
    @stub(static)
    @stub(public)
    @stub(private)
    @stub(protected)
    @stub(override)
    @stub(abstract)
    @stub(open)
    @stub(operator)
    @stub(foreign)
}
