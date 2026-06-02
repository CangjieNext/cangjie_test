package cjworld

import std.unittest.*
import std.unittest.testmacro.*

import objc.lang.*

func times5(arg: Float64): Float64 {
    arg * 5.0
}

@Test
class ObjCBlockTests {
    @TestCase
    func readWrite() {
        let m = M()
        let multiplier = Box<Float64>(2.0)
        let primWithCapture = ObjCBlock<(Float64) -> Float64> ({ it: Float64 => it * multiplier.value })
        @Expect(primWithCapture.call(3.0), 6.0, delta: 0.00001)
        let n = N()
        @Expect(n.mapF(primWithCapture), 2.0, delta: 0.00001)
        @Expect(n.mapF(primWithCapture), 2.0, delta: 0.00001)
        @Expect(n.mapF(primWithCapture), 2.0, delta: 0.00001)
        multiplier.value = 3.0
        @Expect(n.mapF(primWithCapture), 3.0, delta: 0.00001)
        @Expect(n.mapF(primWithCapture), 3.0, delta: 0.00001)
        @Expect(n.mapF(primWithCapture), 3.0, delta: 0.00001)
        multiplier.value = 2.0
        let k = m.makeK()
        @Expect(k.mapF(primWithCapture), 6.28, delta: 0.00001)
        @Expect(k.mapF(primWithCapture), 6.28, delta: 0.00001)
        @Expect(k.mapF(primWithCapture), 6.28, delta: 0.00001)
        multiplier.value = 1.0
        @Expect(k.mapF(primWithCapture), 3.14, delta: 0.00001)
        @Expect(k.mapF(primWithCapture), 3.14, delta: 0.00001)
        @Expect(k.mapF(primWithCapture), 3.14, delta: 0.00001)

        let fLam = { it: Float64 => it * 4.0 }
        let primWithoutCapture = ObjCBlock<(Float64) -> Float64> (fLam)
        @Expect(n.mapF(primWithoutCapture), 4.0, delta: 0.00001)
        @Expect(n.mapF(primWithoutCapture), 4.0, delta: 0.00001)
        @Expect(n.mapF(primWithoutCapture), 4.0, delta: 0.00001)

        @Expect(k.mapF(primWithoutCapture), 12.56, delta: 0.00001)
        @Expect(k.mapF(primWithoutCapture), 12.56, delta: 0.00001)
        @Expect(k.mapF(primWithoutCapture), 12.56, delta: 0.00001)
    
        let primFromTopLevel = ObjCBlock<(Float64) -> Float64> (times5)
        @Expect(n.mapF(primFromTopLevel), 5.0, delta: 0.00001)
        @Expect(n.mapF(primFromTopLevel), 5.0, delta: 0.00001)
        @Expect(n.mapF(primFromTopLevel), 5.0, delta: 0.00001)

        @Expect(k.mapF(primFromTopLevel), 15.7, delta: 0.00001)
        @Expect(k.mapF(primFromTopLevel), 15.7, delta: 0.00001)
        @Expect(k.mapF(primFromTopLevel), 15.7, delta: 0.00001)

        @Expect(n.id(), 1)
        let n2 = n.letF(ObjCBlock<(N) -> N>({ it => m.makeNFunc().call(N()) }))
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
                add(ObjCBlockTests().asTestSuite()).
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
