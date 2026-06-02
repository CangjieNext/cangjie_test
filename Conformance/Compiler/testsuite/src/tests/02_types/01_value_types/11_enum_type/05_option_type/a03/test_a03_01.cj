/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_05_a03_01

  @Level:         1

  @Assertion:       2.1.11.5(3) An alternative way of writing Option type is to prefix the type name with a ?, 
  i.e., for any type Type, ?Type is equivalent to Option<Type>. For example, ?Int32 is equivalent to Option<Int32>, 
  ?String is equivalent to Option<String>, etc.

  @Description:     Checks that the specified syntax works for various kinds: value types, reference types, functions

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

struct S {
    S(var a: ?ToString) {}
}
type T = S
main() {
    var v1: ?Bool = None
    Assert.isTrue(v1 is Option<Bool>)
    Assert.isTrue(None<Int16> is ?Int16)
    Assert.isTrue(Some(r'q') is ?Rune)
    match (Some(())) {
        case _ : ?Unit => ()
        case _ => Assert.fail()
    }
    func f (x: ?(String, Range<UInt32>)) {}
    Assert.isTrue(f is (Option<(String, Range<UInt32>)>) -> Unit)
    var fr: ?(Option<(String, Range<UInt32>)>) -> Unit = Some(f)
    match (fr) {
        case Some(x) => Assert.isTrue(x is (Option<(String, Range<UInt32>)>) -> Unit)
        case _ => Assert.fail()
    }
    let s:?S = None
    Assert.isTrue(s is ?T)
}
