/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a03_01

  @Level:         1

  @Assertion:       2.1.10.5(3) Using StructName(arguments) for defining instances of struct that are not generic.

  @Description:     Check that it's possible to create instances of non-generic struct.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S {
    let v: Int32
    S(v: Int32) { this.v = v }
    init(v: Float64) { this(Int32(v)) }
}

main() {
    Assert.equals(13, S(13.0).v)
}
