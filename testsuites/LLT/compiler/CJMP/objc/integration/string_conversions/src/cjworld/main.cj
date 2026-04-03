// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

@Test
class ObjCFuncTests {
    @TestCase
    func convertToNSString() {
        @Expect("Hello, world!", M.helloAscii().toString())
        @Expect("Привет, мир!", M.helloCyrillic().toString())
        @Expect("你好世界！", M.helloCangjie().toString())
        @Expect("👋🏻🗺️", M.helloEmoji().toString())
    }

    @TestCase
    func convertToString() {
        @Expect(NSString("Hello, world!"), M.helloAscii())
        @Expect(NSString("Привет, мир!"), M.helloCyrillic())
        @Expect(NSString("你好世界！"), M.helloCangjie())
        @Expect(NSString("👋🏻🗺️"), M.helloEmoji())
    }

    @TestCase
    func convertBackAndForth() {
        @Expect("Hello, world!", NSString("Hello, world!").toString());
        @Expect("Привет, мир!", NSString("Привет, мир!").toString())
        @Expect("你好世界！", NSString("你好世界！").toString())
        @Expect("👋🏻🗺️", NSString("👋🏻🗺️").toString())
    }

    @TestCase
    func convertEmpty() {
        @Expect("", M.empty().toString())
        @Expect(NSString(""), M.empty())
        @Expect("", NSString("").toString())
    }

    @TestCase
    func convertLong() {
        let str = ("Hello, world! " * 10000)
        @Expect(NSString(str), M.long())
        @Expect(str, M.long().toString())
    }

    @TestCase
    func modifyInObjC() {
        let str = "Hello, world!";
        let upperStr = M.uppercase(NSString(str))
        @Expect(str.toAsciiUpper(), upperStr.toString())
    }

    @TestCase
    func modifyInCangjie() {
        let str = M.helloAscii()
        let upperStr = str.toString().toAsciiUpper()
        M.checkUpperHelloAscii(NSString(upperStr))
    }

    @TestCase
    func exportedImpl() {
        M.checkExportedImpl()
    }
}

@C
func cangjieMain(): Int64 {
    try {
        let result =
            TestGroup.builder(@sourcePackage())
                .add(ObjCFuncTests().asTestSuite())
                .build()
                .runTests()
        result.reportTo(ConsoleReporter())
        return result.failedCount + result.errorCount
    } catch (e: Exception) {
        eprintln(e.message)
        return 1
    }

    return 0
}
