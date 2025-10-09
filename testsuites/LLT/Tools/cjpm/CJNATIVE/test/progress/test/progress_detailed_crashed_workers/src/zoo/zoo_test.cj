// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.zoo

import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase

@Test
class ZooTest {
    @TestCase
    func passing1() {
        printStdout()
        @Expect(1, 1)
    }

    @TestCase
    func failing1() {
        sleep(10 *Duration.second)
        printStderr()
        @Expect(1, 2)
    }

    static func printStdout() {
        print("should not be printed in passing1")
    }

    static func printStderr() {
        print("should be printed in failing1")
    }
}