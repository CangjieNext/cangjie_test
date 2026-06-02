/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a03_01

  @Level:         1

  @Assertion:       4.4.2(3) For each kinds of pattern described above, we have the following rules. The constant
                    pattern is always refutable pattern.

  @Description:     Check that a constant pattern can't be a irrefutable pattern, i.e. there is a constant pattern that
                    cannot match the value it is intended to match.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let v = true
    match(v) {
        case false => ()
        case _ => Assert.notEquals(false, v) // The value `v` and the constant pattern `false` do not match.
    }
}
