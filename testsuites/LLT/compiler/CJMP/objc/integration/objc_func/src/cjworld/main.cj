package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

@Test
class ObjCFuncTests {
    @TestCase
    func readWrite() {
        let m = M()
        let fptr = m.fPtr()
        @Expect(fptr.call(3.0), 6.0)
        let n = N()
        @Expect(n.mapF(fptr), 2.0)
        let k = m.makeK()
        @Expect(k.mapF(fptr), 6.28)
        @Expect(n.id(), 1)
        let n2 = n.letF(m.makeNFunc())
        @Expect(n.id(), 1)
        @Expect(n2.id(), 2)
        let n3 = m.makeNFunc().call(n2)
        @Expect(n.id(), 1)
        @Expect(n2.id(), 2)
        @Expect(n3.id(), 3)
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
