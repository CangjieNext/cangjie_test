/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC:%set_stdx_path %run %run_opt %output %run_utest_opt

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

/**
 *  测试JsonWriter的 JsonObject 是否正确
 */
@Test
class Test_JsonWriter_Object {

    //正常场景,1个元素，2..个元素
    @TestCase
    func testWriteObject(): Unit {
        let w = writer()
        w.jw.startObject()
        w.jw.writeName("v1").writeValue(1)
        w.jw.endObject()
        @Assert(w.toString(),"{\"v1\":1}")

        let w2 = writer()
        w2.jw.startObject()
        w2.jw.writeName("v1").writeValue(1)
        w2.jw.writeName("v2").writeValue(2)
        w2.jw.writeName("v3").writeValue(3)
        w2.jw.endObject()
        @Assert(w2.toString(),"{\"v1\":1,\"v2\":2,\"v3\":3}")
    }

    @TestCase
    func testWriteNameInObject(): Unit {
        var errno = 0
        let w = writer()
        w.jw.startObject()
        w.jw.writeName("v1")

        try {
            w.jw.writeName("v12")
        } catch (_: IllegalStateException) {
            errno++
        }

        try {
            w.jw.endObject()
        } catch (_: IllegalStateException) {
            errno++
        }

        w.jw.startObject()
        w.jw.writeName("vv1").writeValue(1)
        w.jw.endObject()
        w.jw.endObject()

        @Assert(errno, 2)
        @Expect("{\"v1\":{\"vv1\":1}}", w.toString())
    }
}
