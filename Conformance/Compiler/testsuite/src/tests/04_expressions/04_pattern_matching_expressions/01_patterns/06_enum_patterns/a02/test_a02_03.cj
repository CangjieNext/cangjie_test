/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_03

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor with the constant patten parameter.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E {
    | A(Int8)
    | B(Int16)
    | C(Int32)
    | D(Int64)
    | E(UInt8)
    | F(UInt16)
    | G(UInt32)
    | H(UInt64)
    | I(IntNative)
    | J(Float32)
    | K(Float64)
    | L(Rune)
    | M(Byte)
    | N(String)
    | O(Bool)
    | P(Unit)
}

main() {
    Assert.isTrue(match(A(1i8)) {
        case A(1i8) => true
        case _ => false
    })
    Assert.isTrue(match(B(1i16)) {
        case B(1i16) => true
        case _ => false
    })
    Assert.isTrue(match(C(1i32)) {
        case C(1i32) => true
        case _ => false
    })
    Assert.isTrue(match(D(1i64)) {
        case D(1i64) => true
        case _ => false
    })
    Assert.isTrue(match(E.E(1u8)) {
        case E.E(1u8) => true
        case _ => false
    })
    Assert.isTrue(match(F(1u16)) {
        case F(1u16) => true
        case _ => false
    })
    Assert.isTrue(match(G(1u32)) {
        case G(1u32) => true
        case _ => false
    })
    Assert.isTrue(match(H(1u64)) {
        case H(1u64) => true
        case _ => false
    })
    Assert.isTrue(match(I(1)) {
        case I(1) => true
        case _ => false
    })
    Assert.isTrue(match(J(10.0_f32)) {
        case J(10.0_f32) => true
        case _ => false
    })
    Assert.isTrue(match(K(0.5)) {
        case K(0.5) => true
        case _ => false
    })
    Assert.isTrue(match(L(r'a')) {
        case L(r'a') => true
        case _ => false
    })
    Assert.isTrue(match(M(b'a')) {
        case M(b'a') => true
        case _ => false
    })
    Assert.isTrue(match(N("AAA")) {
        case N("AAA") => true
        case _ => false
    })
    Assert.isTrue(match(O(true)) {
        case O(true) => true
        case _ => false
    })
    Assert.isTrue(match(P(())) {
        case P(()) => true
        case _ => false
    })
    return
}
