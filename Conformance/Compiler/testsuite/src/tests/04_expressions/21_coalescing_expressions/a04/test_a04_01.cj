
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a04_01

  @Level:         1

  @Assertion:   4.21(4) 2. The type of the expression e1 ?? e2 is T.
  @Description: Checks that e1 ?? e2 is T for e1 of type Option<T> and e2 of type T for various T. 
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

func checkType<T>(x : T) {
    Assert.isTrue((Option<T>.Some(x) ?? x) is T)
}

main() {
    checkType(1i8)
    checkType(1i16)
    checkType(1i32)
    checkType(1i64)
    checkType(1u8)
    checkType(1u16)
    checkType(1u32)
    checkType(1u64)
    checkType(1.0f16)
    checkType(1.0f32)
    checkType(1.0f64)
    checkType("1")
    checkType('1')
    checkType(true)
    checkType(())
    checkType((1, 2))
    checkType(C(0))
    0
}

