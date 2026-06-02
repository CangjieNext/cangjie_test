/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_08_a01_04
  @Assertion:       func throws(f: ()->Unit, check!: (Exception)->Bool = { unused => true }, reason!: String = "")

  @Description:     If the `check` function throws an exception, `throws` does not catch it.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    try {
        Assert.throws({ => throw SpawnException() }, check: { unused => throw IllegalArgumentException() })
        throw Exception("No expected AssertException")
    } catch (ok: IllegalArgumentException) {
    } catch (e: Exception) {
        throw Exception("Unexpected exception '${e}'")
    }
}
