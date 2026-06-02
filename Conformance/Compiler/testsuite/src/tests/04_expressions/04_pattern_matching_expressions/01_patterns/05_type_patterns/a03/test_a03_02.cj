/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a03_02

  @Level:         1

  @Assertion: 4.4.1.5(3) For the type pattern varBindingPattern: type (or wildcardPattern : type). A type pattern
              is successfully matched only if the variable to be matched is of type type or its subtype.
              In the latter case, the variable is casted into type type.

  @Description: Checks matching the variable of the same type as type in type pattern with the binding pattern.
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
        case foo: A => true
        case _ => false
    })
    Assert.isTrue(match(B()) {
        case _: B  =>  true
        case _ => false
    })
    Assert.isTrue(match(C()) {
        case foo: C => true
        case _ => false
    })
    Assert.isTrue(match(10i8) {
        case foo: Int8 => true
        case _ => false
    })
    Assert.isTrue(match(10i16) {
        case foo: Int16 => true
        case _ => false
    })
    Assert.isTrue(match(10i32) {
        case foo: Int32 => true
        case _ => false
    })
    Assert.isTrue(match(10i64) {
        case foo: Int64 => true
        case _ => false
    })
    Assert.isTrue(match(10u8) {
        case foo: UInt8 => true
        case _ => false
    })
    Assert.isTrue(match(10u16) {
        case foo: UInt16 => true
        case _ => false
    })
    Assert.isTrue(match(10u32) {
        case foo: UInt32 => true
        case _ => false
    })
    Assert.isTrue(match(10u64) {
        case foo: UInt64 => true
        case _ => false
    })
    Assert.isTrue(match(10.5_f32) {
        case foo: Float32 => true
        case _ => false
    })
    Assert.isTrue(match(10.5) {
        case foo: Float64 => true
        case _ => false
    })
    Assert.isTrue(match(10.5) {
        case foo: Float64 => true
        case _ => false
    })
    Assert.isTrue(match(r'a') {
        case foo: Rune => true
        case _ => false
    })
    Assert.isTrue(match(b'a') {
        case foo: Byte => true
        case _ => false
    })
    Assert.isTrue(match("a") {
        case foo: String => true
        case _ => false
    })
    Assert.isTrue(match(()) {
        case foo: Unit => true
        case _ => false
    })
    Assert.isTrue(match(true) {
        case foo: Bool => true
        case _ => false
    })
    Assert.isTrue(match(Some(1)) {
        case foo: Option<Int64> => true
        case _ => false
    })
    Assert.isTrue(match([1, 2, 3]) {
        case foo: Array<Int64> => true
        case _ => false
    })
    return
}
