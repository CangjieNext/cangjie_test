/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_08_a01_01
  @Assertion:       func throws(f: ()->Unit, check!: (Exception)->Bool = { unused => true }, reason!: String = "")

  @Description:     Positive cases without exceptions: calling the `f` function throws an exception, `Assert.throws`
                    catches it, checks that the `check` function returns `true`.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.*

main() {
    let exceptionMsg = "Hello, Cangjie!"
    Assert.throws({ => throw Exception() })
    Assert.throws({ => throw Exception(exceptionMsg) }, check: { e: Exception => e.toString().contains(exceptionMsg) })
    Assert.throws({ => throw Exception() }, reason: "Must not fail")
    Assert.throws({ => throw IllegalArgumentException() },
                  check: { e: Exception => e is IllegalArgumentException },
                  reason: "Must not fail1")
}
