/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description: Coverage the funcs for test_macro.cj
 * Test API: public macro Test(input: Tokens): Tokens
 *           public func assertEqual<T>(leftStr:String, rightStr:String, expected: Array<T>, actual: Array<T>): Unit where T <: ToString & Equatable<T>
 */

import std.unittest.*
import std.unittest.testmacro.*

@Test
class A {}

@Test
class B {
    public var id: Int64
    public B(id: Int64) {
        this.id = id
    }
    init() {
        this(0)
    }
}

main(): Int64 {
    var a: Array<Int64> = [1, 1, 1, 1, 1]
    var b: Array<Int64> = [1, 1, 1, 1, 1]
    assertEqual("a", "b", a, b)
    return 0
}
