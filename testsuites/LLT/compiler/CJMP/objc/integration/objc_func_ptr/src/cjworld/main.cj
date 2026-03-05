package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

@Test
class ObjCFuncTests {
    @TestCase
    func readWrite() {
        @Expect(A().f2(), 32)
    }
}

@C
func cangjieMain(): Int64 {
    try {
        let result =
            TestGroup.builder(@sourcePackage()).
                add(ObjCFuncTests().asTestSuite()).
                build().
                runTests()
        result.reportTo(ConsoleReporter())
        return result.failedCount + result.errorCount
    } catch (e: Exception) {
        eprintln(e.message)
        return 1
    }
    return 0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
