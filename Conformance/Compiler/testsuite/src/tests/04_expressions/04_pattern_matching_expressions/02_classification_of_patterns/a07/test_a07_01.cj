/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a07_01

  @Level:         1

  @Assertion:       4.4.2(7) The type pattern is always refutable pattern.

  @Description:     Check that a type pattern can't be an irrefutable pattern, i.e. there is a type pattern that cannot
                    match the value it is intended to match.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let v = true
    match (v) {
        case _: Int64 => Assert.fail() // Not matched => irrefutable
        case _ => Assert.notEquals(false, v)
    }
    match (v) {
        case x: Option<Bool> => Assert.fail() // Not matched => irrefutable
        case _ => Assert.notEquals(false, v)
    }
}
