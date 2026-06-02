
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a11_001

  @Level:         1

  @Assertion:   4.23(11) 2._expression ignores the result of the right expression of = expressions (Wildcards are
                prohibited for compound assignment expressions).
  @Description: Checks that assignment to _ is permitted for various types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

class C {
    let x : Int64
    init(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

main() {
    _ = 1i8
    _ = 1i16
    _ = 1i32
    _ = 1i64
    _ = 1u8
    _ = 1u16
    _ = 1u32
    _ = 1u64
    _ = 1.0f16
    _ = 1.0f32
    _ = 1.0f64
    _ = true
    _ = r'1'
    _ = "1"
    _ = 1..2
    _ = (1, '2')
    _ = C(1)
    _ = ()
    do { _ = break } while(false)
    return 0
}
