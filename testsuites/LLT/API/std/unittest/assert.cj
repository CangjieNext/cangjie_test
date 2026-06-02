/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args
// ASSERT: scan ok
// ASSERT: scan no equal
/*
 * Test description: Test the funcs for assert.cj
 * Test API: public func assertEqual<T>(leftStr:String, rightStr:String, expected: Array<T>, actual: Array<T>): Unit where T <: ToString & Equatable<T>
 *           public open class AssertException <: Exception {
 *               public init(message: String)
 *               protected open override func getClassName(): String
 *           }
 */

internal import std.unittest.*

class A <: ToString & Equatable<Int64> {
    public operator func !=(rhs: Int64): Bool {
        return true
    }
    public operator func ==(rhs: Int64): Bool {
        return true
    }
    public func toString(): String {
        return "A"
    }
}

main() {
    var a: Array<Int64> = [1, 2, 3, 4]
    var b: Array<Int64> = [6, 72, 83, 75]
    try {
        assertEqual("abcf", "abcf", a, b)
    } catch (_) {
        println("ok")
    }
    var a1: Array<Int64> = [1, 2, 3, 4]
    var b1: Array<Int64> = [1, 2, 3, 4]
    try {
        assertEqual("abcf", "abcf", a1, b1)
    } catch (_) {
        println("no")
    }
    var a2: Array<Int64> = [1, 2, 3, 4]
    var b2: Array<Int64> = [1, 2, 3]
    try {
        assertEqual("abcf", "abcf", a2, b2)
    } catch (_) {
        println("no equal")
    }
    var a50 = AssertException()
    if (a50.toString() != "AssertException") {
        return -1
    }
    return 0
}
