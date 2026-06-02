
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a03_001

  @Level:         1

  @Assertion:   4.21(3) The coalescing operator is used for unwrapping values of Option types. Suppose the type of the
                expression e1 is Option<T>, then we have following rules about the expression e1 ?? e2.
                1.The type of the expression e2 must be T.
  @Description: Checks that using ?? with types Option<T> and T is permitted for various T.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

main() {
    Assert.equals(1, Option<Int8>.Some(1) ?? Int8(1))
    Assert.equals(1, Option<Int16>.Some(1) ?? Int16(1))
    Assert.equals(1, Option<Int32>.Some(1) ?? Int32(1))
    Assert.equals(1, Option<Int64>.Some(1) ?? Int64(1))
    Assert.equals(1, Option<UInt8>.Some(1) ?? UInt8(1))
    Assert.equals(1, Option<UInt16>.Some(1) ?? UInt16(1))
    Assert.equals(1, Option<UInt32>.Some(1) ?? UInt32(1))
    Assert.equals(1, Option<UInt64>.Some(1) ?? UInt64(1))
    Assert.equals(1.0, Option<Float16>.Some(1.0) ?? Float16(1.0))
    Assert.equals(1.0, Option<Float32>.Some(1.0) ?? Float32(1.0))
    Assert.equals(1.0, Option<Float64>.Some(1.0) ?? Float64(1.0))
    Assert.equals("1", Option<String>.Some("1") ?? "1")
    Assert.equals(r'1', Option<Rune>.Some(r'1') ?? r'1')
    Assert.equals(true, Option<Bool>.Some(true) ?? true)
    Assert.isTrue(() == (Option<Unit>.Some(()) ?? ()))
    Assert.equals(2, (Option<(Int8, Int8)>.Some((1, 2)) ?? (1, 1))[1])
    Assert.equals([], Option<Array<Int8>>.Some([]) ?? Array<Int8>())
    Assert.equals(1, (Option<C>.Some(C(1)) ?? C(2)).x)
    0
}
