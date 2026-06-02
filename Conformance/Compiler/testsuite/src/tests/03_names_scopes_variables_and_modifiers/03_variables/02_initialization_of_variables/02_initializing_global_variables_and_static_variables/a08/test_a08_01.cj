/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a08_01

  @Level:         1

  @Assertion:    3.3.2.2(8) Declaration of a global/static variable must initialize it immediately.
                 That is, the declaration must provide an initialization expression and be in the form
                 of let v = e or var v = e.

  @Description:  Checks that declarations of global variables with immediate initializing are valid.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

var gvInt: Int32 = 0
var gvTuple = (1.1, 2.2)
var gvBool = true
var gvRange: Range<Int32> = 1..10

let glInt: Int32 = 0
let glTuple = (1.1, 2.2)
let glBool = true
let glRange: Range<Int32> = 1..10

public var pgvInt: Int32 = 0
public var pgvTuple = (1.1, 2.2)
public var pgvBool = true
public var pgvRange: Range<Int32> = 1..10

public let pglInt: Int32 = 0
public let pglTuple = (1.1, 2.2)
public let pglBool = true
public let pglRange: Range<Int32> = 1..10

main() {
}
