/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a03_01

  @Level:         1

  @Assertion: 4.4.1.5(3) For the type pattern varBindingPattern: type (or wildcardPattern : type). A type pattern
              is successfully matched only if the variable to be matched is of type type or its subtype.
              In the latter case, the variable is casted into type type.

  @Description: Checks matching the variable of the same type as type in type pattern with the wildcard pattern.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class A {}
open class B <: A {}
class C <: B {}

main() {
    Assert.isTrue(match(A()) {
        case _: A => true
        case _ => false
    })
    Assert.isTrue(match(B()) {
        case _: B  =>  true
        case _ => false
    })
    Assert.isTrue(match(C()) {
        case _: C => true
        case _ => false
    })
    Assert.isTrue(match(10i8) {
        case _: Int8 => true
        case _ => false
    })
    Assert.isTrue(match(10i16) {
        case _: Int16 => true
        case _ => false
    })
    Assert.isTrue(match(10i32) {
        case _: Int32 => true
        case _ => false
    })
    Assert.isTrue(match(10i64) {
        case _: Int64 => true
        case _ => false
    })
    Assert.isTrue(match(10u8) {
        case _: UInt8 => true
        case _ => false
    })
    Assert.isTrue(match(10u16) {
        case _: UInt16 => true
        case _ => false
    })
    Assert.isTrue(match(10u32) {
        case _: UInt32 => true
        case _ => false
    })
    Assert.isTrue(match(10u64) {
        case _: UInt64 => true
        case _ => false
    })
    Assert.isTrue(match(10.5_f32) {
        case _: Float32 => true
        case _ => false
    })
    Assert.isTrue(match(10.5) {
        case _: Float64 => true
        case _ => false
    })
    Assert.isTrue(match(10.5) {
        case _: Float64 => true
        case _ => false
    })
    Assert.isTrue(match(r'a') {
        case _: Rune => true
        case _ => false
    })
    Assert.isTrue(match(b'a') {
        case _: Byte => true
        case _ => false
    })
    Assert.isTrue(match("a") {
        case _: String => true
        case _ => false
    })
    Assert.isTrue(match(()) {
        case _: Unit => true
        case _ => false
    })
    Assert.isTrue(match(true) {
        case _: Bool => true
        case _ => false
    })
    Assert.isTrue(match(Some(1)) {
        case _: Option<Int64> => true
        case _ => false
    })
    Assert.isTrue(match([1, 2, 3]) {
        case _: Array<Int64> => true
        case _ => false
    })
    return
}
