/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_05_a13_01

  @Level:         1

  @Assertion:      2.1.11.5(13) For an expression e1 of type Option<T> 
  and an expression e2 of type T, the expression e1 ?? e2 has type T.

 
  @Description:     Checks type of Option coalescing expression 

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

main() {
    var a = Some(123) ?? 321
    Assert.isTrue(a is Int64)
    let b = None<Rune> ?? r'a'
    Assert.isTrue(b is Rune)
    Assert.isTrue((Some(None<(String,Unit)>) ?? Some(("", ()))) is Option<(String, Unit)>)
}
