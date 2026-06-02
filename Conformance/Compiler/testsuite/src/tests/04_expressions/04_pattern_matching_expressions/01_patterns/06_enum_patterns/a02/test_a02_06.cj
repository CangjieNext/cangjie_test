/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_06

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor with the tuple patten parameter.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    | A((Int8, Int8))
    | B((Int16, Int16))
    | C((Int32, Int32))
    | D((Int64, Int64))
    | E((UInt8, UInt8))
    | F((UInt16, UInt16))
    | G((UInt32, UInt32))
    | H((UInt64, UInt64))
    | I((IntNative, IntNative))
    | J((Float32, Float32))
    | K((Float64, Float64))
    | L((Rune, Rune))
    | M((Byte, Byte))
    | N((String, String))
    | O((Bool, Bool))
    | P((Unit, Unit))
}

main() {
    Assert.isTrue(match(A((1i8, 1i8))) {
        case A((foo, 1i8)) => true
        case _ => false
    })
    Assert.isTrue(match(B((1i16, 1i16))) {
        case B((foo, 1i16)) => true
        case _ => false
    })
    Assert.isTrue(match(C((1i32, 1i32))) {
        case C((foo, 1i32)) => true
        case _ => false
    })
    Assert.isTrue(match(D((1i64, 1i64))) {
        case D((foo, 1i64)) => true
        case _ => false
    })
    Assert.isTrue(match(E.E((1u8, 1u8))) {
        case E.E((foo, 1u8)) => true
        case _ => false
    })
    Assert.isTrue(match(F((1u16, 1u16))) {
        case F((foo, 1u16)) => true
        case _ => false
    })
    Assert.isTrue(match(G((1u32, 1u32))) {
        case G((foo, 1u32)) => true
        case _ => false
    })
    Assert.isTrue(match(H((1u64, 1u64))) {
        case H((foo, 1u64)) => true
        case _ => false
    })
    Assert.isTrue(match(I((1, 1))) {
        case I((foo, 1)) => true
        case _ => false
    })
    Assert.isTrue(match(J((10.0_f32, 10.0_f32))) {
        case J((foo, 10.0_f32)) => true
        case _ => false
    })
    Assert.isTrue(match(K((0.5, 0.5))) {
        case K((foo, 0.5)) => true
        case _ => false
    })
    Assert.isTrue(match(L((r'a', r'a'))) {
        case L((foo, r'a')) => true
        case _ => false
    })
    Assert.isTrue(match(M((b'a', b'a'))) {
        case M((foo, b'a')) => true
        case _ => false
    })
    Assert.isTrue(match(N(("AAA", "AAA"))) {
        case N((foo, "AAA")) => true
        case _ => false
    })
    Assert.isTrue(match(O((true, true))) {
        case O((foo, true)) => true
        case _ => false
    })
    Assert.isTrue(match(P(((), ()))) {
        case P((foo, ())) => true
        case _ => false
    })
    return
}
