// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.doo

import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase

@Test
class printBeforeTests {
    @TestCase
    func passing1(): Unit {
        @Expect(1, 1)
        printStdout()
    }

    @TestCase
    func failing1(): Unit {
        @Expect(1, 2)
        printStderr()
    }

    static init() {
        print("Should be printed before tests in stdout\n")
        eprint("Should be printed before tests in stderr\n")
    }

    static func printStdout() {
        print("Should not be printed in passing1 stdout\n")
    }

    static func printStderr() {
        eprint("Should be printed in failing1 stderr\n")
    }
}
