/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.io.*
import stdx.encoding.json.stream.*

class writer <: ToString {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    public func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }
}

@Test
class Test_tojson_float_03 {
    @TestCase
    func test_float16_01(): Unit {
        var w = writer()
        let num: Float16 = 0.01
        num.toJson(w.jw)
        @Expect(w.toString(), "0.010002")
    }

    @TestCase
    func test_float16_02(): Unit {
        var w = writer()
        let num: Float16 = -1.111
        num.toJson(w.jw)
        @Expect(w.toString(), "-1.111328")
    }

    @TestCase
    func test_float16_03(): Unit {
        var w = writer()
        let num: Float16 = 0.0000
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }

    @TestCase
    func test_float32_04(): Unit {
        var w = writer()
        let num: Float32 = 0.01
        num.toJson(w.jw)
        @Expect(w.toString(), "0.01")
    }

    @TestCase
    func test_float32_05(): Unit {
        var w = writer()
        let num: Float32 = -1.111
        num.toJson(w.jw)
        @Expect(w.toString(), "-1.111")
    }

    @TestCase
    func test_float32_06(): Unit {
        var w = writer()
        let num: Float32 = 0.0000
        num.toJson(w.jw)
        @Expect(w.toString(), "0")
    }
}
