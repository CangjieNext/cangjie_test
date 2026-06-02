/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_03_a01_02

  @Level:         1

  @Assertion: 6.1.3(1)
              The class Object is the superclass of all other classes (interfaces are not included),
              and the class Object does not contain any members, i.e. Object is an “empty” class

  @Description: Check that standard classes are subtypes of Object

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

import std.ast.Tokens
import std.collection.*
import std.io.ByteBuffer
import std.regex.Regex
import std.sync.AtomicReference
import std.random.Random
import std.net.*
import std.fs.Directory
import std.env.*

main() {
    let box = Box<Rune>(r'c')
    Assert.isTrue(box is Object)

    let tokens = Tokens()
    Assert.isTrue(tokens is Object)

    let array_list = ArrayList<Int64>()
    Assert.isTrue(array_list is Object)

    let hash_set = HashSet<Int64>()
    Assert.isTrue(hash_set is Object)

    let string_builder = StringBuilder()
    Assert.isTrue(string_builder is Object)

    let byte_array_stream = ByteBuffer()
    Assert.isTrue(byte_array_stream is Object)

    let reg = Regex("fafaf")
    Assert.isTrue(reg is Object)

    let atomic_reference = AtomicReference<Object>(Object())
    Assert.isTrue(atomic_reference is Object)

    let rand = Random()
    Assert.isTrue(rand is Object)

    let directory = Directory()
    Assert.isTrue(directory is Object)
}
