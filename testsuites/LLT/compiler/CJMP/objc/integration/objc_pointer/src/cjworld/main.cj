package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

@Test
class ObjCPointerTests {
    @TestCase
    func readWrite() {
        let m = M()
        @Assert(m.fPtr(ObjCPointer(CPointer())).read(), 3.1)
        @Assert(m.iPtr(ObjCPointer(CPointer())).read(), 42)
        @Assert(m.pPtr(ObjCPointer(CPointer())).read().read(), 42)

        m.fPtr(ObjCPointer(CPointer())).write(3.2)
        m.iPtr(ObjCPointer(CPointer())).write(43)
        m.pPtr(ObjCPointer(CPointer())).read().write(44)

        @Assert(m.fPtr(ObjCPointer(CPointer())).read(), 3.2)
        @Assert(m.iPtr(ObjCPointer(CPointer())).read(), 44)
        @Assert(m.pPtr(ObjCPointer(CPointer())).read().read(), 44)

        let n = m.sPtr(ObjCPointer(CPointer())).read()
        @Assert(n.fPtr(ObjCPointer(CPointer())).read(), 6.2)
        n.fPtr(ObjCPointer(CPointer())).write(48.0)
        @Assert(m.sPtr(ObjCPointer(CPointer())).read().fPtr(ObjCPointer(CPointer())).read(), 48.0)

        m.sPtr(ObjCPointer(CPointer())).write(N())
        @Assert(m.sPtr(ObjCPointer(CPointer())).read().fPtr(ObjCPointer(CPointer())).read(), 6.2)

        let k = m.ssPtr(ObjCPointer(CPointer())).read()
        @Assert(k.fPtr(n.fPtr(ObjCPointer(CPointer()))).read(), 48.0)
        m.ssPtr(ObjCPointer(CPointer())).write(k)
        @Assert(k.fPtr(n.fPtr(ObjCPointer(CPointer()))).read(), 48.0)
    }
}

@C
func cangjieMain(): Int64 {
    try {
        let result = 
            TestGroup.builder(@sourcePackage()).
                add(ObjCPointerTests().asTestSuite()).
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

