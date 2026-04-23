/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test that GlobalFunctionInfo.apply correctly handles object references
 *      through GC barrier when invoking generic functions repeatedly.
 *      This test ensures that reading object references from CJRawArray.data
 *      uses proper GC barrier to prevent reference corruption during
 *      concurrent GC operations.
 * Test API:
 *      public func apply(typeArgs: Array<TypeInfo>, args: Array<Any>): Option<Any>
 */

import std.reflect.*
import std.unittest.*
import std.unittest.testmacro.*

public abstract class Payload {}

public class PayloadA <: Payload {
    public var value: Int64 = 0
    public init(v: Int64) {
        this.value = v
    }
}

public class PayloadB <: Payload {
    public var data: String = ""
    public init(s: String) {
        this.data = s
    }
}

public class PayloadC <: Payload {
    public var count: Int64 = 0
    public init(c: Int64) {
        this.count = c
    }
}

public func visit<T>(value: Payload): Unit {
    ()
}

@Test
class GlobalFunctionInfoGCBarrierTest {
    @TestCase
    func testApplyGenericTypeArgsRepeatedly(): Unit {
        let fn = PackageInfo.get("default").getFunctions("visit")[0]
        let a = PayloadA(100)
        let b = PayloadB("test")
        let c = PayloadC(200)
        
        var i = 0
        while (i < 10000) {
            fn.apply([TypeInfo.of<String>()], [a])
            fn.apply([TypeInfo.of<Int64>()], [b])
            fn.apply([TypeInfo.of<Float64>()], [c])
            i++
        }
        @Assert(true)
    }

    @TestCase
    func testApplyGenericMultipleObjects(): Unit {
        let fn = PackageInfo.get("default").getFunctions("visit")[0]
        
        var i = 0
        while (i < 10000) {
            let obj = PayloadA(i)
            fn.apply([TypeInfo.of<Int64>()], [obj])
            i++
        }
        @Assert(true)
    }

    @TestCase
    func testApplyWithDifferentTypeArgs(): Unit {
        let fn = PackageInfo.get("default").getFunctions("visit")[0]
        let payload = PayloadA(123)
        
        var i = 0
        while (i < 5000) {
            fn.apply([TypeInfo.of<Int64>()], [payload])
            fn.apply([TypeInfo.of<Int32>()], [payload])
            fn.apply([TypeInfo.of<Int16>()], [payload])
            fn.apply([TypeInfo.of<Int8>()], [payload])
            i++
        }
        @Assert(true)
    }
}

main() {
    println("GlobalFunctionInfo GC Barrier Test passed")
}