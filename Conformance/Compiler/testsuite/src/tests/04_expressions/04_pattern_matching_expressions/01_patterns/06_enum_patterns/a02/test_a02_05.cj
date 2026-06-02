/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a02_05

  @Level:         1

  @Assertion: 4.4.1.6(2) enum pattern is used to match an enum constructor in the format constructorName
              (without parameters) or constructorName(pattern_1,pattern_2,... , pattern_k) (with parameters),
              with a number of comma- separated patterns (which can be any other type of pattern, and nesting is
              allowed) within parentheses to match each parameter in turn.

  @Description: Checks that the enum pattern matching an enum constructor with the binding patten parameter.
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
        case A(foo) => true
        case _ => false
    })
    Assert.isTrue(match(B(1i16)) {
        case B(foo) => true
        case _ => false
    })
    Assert.isTrue(match(C(1i32)) {
        case C(foo) => true
        case _ => false
    })
    Assert.isTrue(match(D(1i64)) {
        case D(foo) => true
        case _ => false
    })
    Assert.isTrue(match(E.E(1u8)) {
        case E.E(foo) => true
        case _ => false
    })
    Assert.isTrue(match(F(1u16)) {
        case F(foo) => true
        case _ => false
    })
    Assert.isTrue(match(G(1u32)) {
        case G(foo) => true
        case _ => false
    })
    Assert.isTrue(match(H(1u64)) {
        case H(foo) => true
        case _ => false
    })
    Assert.isTrue(match(I(1)) {
        case I(foo) => true
        case _ => false
    })
    Assert.isTrue(match(J(10.0_f32)) {
        case J(foo) => true
        case _ => false
    })
    Assert.isTrue(match(K(0.5)) {
        case K(foo) => true
        case _ => false
    })
    Assert.isTrue(match(L(r'a')) {
        case L(foo) => true
        case _ => false
    })
    Assert.isTrue(match(M(b'a')) {
        case M(foo) => true
        case _ => false
    })
    Assert.isTrue(match(N("AAA")) {
        case N(foo) => true
        case _ => false
    })
    Assert.isTrue(match(O(true)) {
        case O(foo) => true
        case _ => false
    })
    Assert.isTrue(match(P(())) {
        case P(foo) => true
        case _ => false
    })
    return
}
