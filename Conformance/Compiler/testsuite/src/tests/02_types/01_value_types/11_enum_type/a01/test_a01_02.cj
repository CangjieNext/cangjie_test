/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_a01_02

  @Level:         1

  @Assertion:       2.1.11(1) The enum type is immutable, and used to enumerate a set of related values 
  (called constructors). 
 
  @Description:     Checks that enum unwrapping does not change for mutable reference type

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @Issue:           6504


  @Comment:

*/
import utils.assert.Assert

class C {
    var i = 89
}
enum E { |A(C)}

main() {
    var c = C()
    var e = A(c)
    c.i = 45
    match (e) {
        case A(m) => Assert.equals(45, m.i)
    }

    var o = Some(c)
    c.i = 965
    Assert.equals(965, o?.i ?? 0)
}
