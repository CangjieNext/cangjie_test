/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            bug_0006523
  @Assertion:       0006523: Following test fails on assertion for unexpected reason.
  @Description:     Check the source code example from the bug 0006523.
  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore
*/

import std.convert.*, math.abs, os.*

type Tuple = (Int64, Int64)

type Array = Array<Int64>

func nothing() {
    var n : Nothing
    do { n = break } while(false)
    return n
}

public class AssertException <: Exception {
    private let assertionMessage: String

    public init(message: String) {
        assertionMessage = message
    }

    public override func toString() {
        "AssertException: " + assertionMessage
    }
}

func fail(assertionName: String, reason: String) {
    let reasonStr = if (reason.isEmpty()) { "" } else { " with reason '${reason}'" }
    throw AssertException("Assertion '${assertionName}' failed${reasonStr}")
}

public class Assert {
    // The != operator is used to check. Nan's are considered equivalent.
    static public func equals<T>(expected: T, actual: T, reason!: String = "") where T <: Equatable<T> {
        if (expected != actual) {
            let argStr = if (actual is ToString) {
                "(expected='${expected as ToString ?? ""}', actual='${actual as ToString ?? ""}')"
            } else {
                ""
            }
            fail("equals" + argStr, reason)
        }
    }
}

var logStr = ""

main() {
    let f14 = { arg : String => logStr += arg + " |> (f14"; () }
    let g14 = { arg : Unit => logStr += " ~> g14)" }
    logStr = ""
    (f14 ~> g14)("1")
    Assert.equals("1 |> (f14 ~> g14)", logStr)
    logStr = ""
    g14(f14("1"))
    Assert.equals("1 |> (f14 ~> g14)", logStr)

    let f35 = { arg : String => logStr += arg + " |> (f35"; nothing() }
    let g35 = { arg : Unit => logStr += " ~> g35)" }
    logStr = ""
    (f35 ~> g35)("1")
    Assert.equals("1 |> (f35 ~> g35)", logStr)
    logStr = ""
    g35(f35("1"))
    Assert.equals("1 |> (f35 ~> g35)", logStr)
}
