/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a05_01

  @Level:         1

  @Assertion: 4.4.1.4(5) Moreover, if the pattern in the tuple pattern is a constant pattern or an enum pattern, it
              needs to has the same type as the corresponding element of the selector.

  @Description: Checks matching of the tuple pattern with the constant pattern in it.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(match ((10i8, 10i16)) {
        case (10i8, 10i16) => true // (Int8, Int16)
        case _ => false
    })
    Assert.isTrue(match ((10i32, 10i64)) {
        case (10i32, 10i64) => true // (Int32, Int64)
        case _ => false
    })
    Assert.isTrue(match ((10u8, 10u16)) {
        case (10u8, 10u16) => true // (UInt8, UInt16)
        case _ => false
    })
    Assert.isTrue(match ((10u32, 10u64)) {
        case (10u32, 10u64) => true // (UInt32, UInt64)
        case _ => false
    })
    Assert.isTrue(match ((10.5_f32, 10.5)) {
        case (10.5_f32, 10.5) => true // (Float32, Float64)
        case _ => false
    })
    Assert.isTrue(match (('a', '\u{41}')) {
        case ('a', 'A') => true // (Rune, Rune)
        case _ => false
    })
    Assert.isTrue(match ((b'a', b'\u{AB}')) {
        case (b'a', b'\u{AB}') => true // (Byte, Byte)
        case _ => false
    })
    Assert.isTrue(match (("a", #"b"#)) {
        case ("a", #"b"#) => true // (String, String)
        case _ => false
    })
    Assert.isTrue(match (((), ())) {
        case ((), ()) => true // (Unit, Unit)
        case _ => false
    })
    Assert.isTrue(match ((true, false)) {
        case (true, false) => true // (Bool, Bool)
        case _ => false
    })
    return
}
