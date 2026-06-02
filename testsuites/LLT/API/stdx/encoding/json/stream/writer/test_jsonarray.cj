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
 *  测试JsonWriter的 Array是否正确
 */
@Test
class Test_JsonWriter_Array {

    //正常场景,1个元素，2..个元素
    @TestCase
    func testWriteArray(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue(1)
        w.jw.endArray()
        @Assert(w.toString(),"[1]")

        let w2 = writer()
        w2.jw.startArray()
        w2.jw.writeValue(1)
        w2.jw.writeValue(2.0)
        w2.jw.writeValue(3.14)
        w2.jw.endArray()
        @Assert(w2.toString(),"[1,2,3.14]")
    }

    @TestCase
    func testWriteArrayString(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.writeValue("abc")
        w.jw.writeValue("def")
        w.jw.endArray()
        @Assert(w.toString(),"[\"abc\",\"def\"]")
    }

    @TestCase
    func testWriteNameInArray(): Unit {
        var errno = 0
        let w = writer()
        w.jw.startArray()
        try {
            w.jw.writeName("abc")
        } catch (e: IllegalStateException) {
            errno++
        }
        w.jw.startArray()
        try {
            w.jw.writeName("abc")
        } catch (e: IllegalStateException) {
            errno++
        }
        w.jw.endArray()
        try {
            w.jw.writeName("abc")
        } catch (e: IllegalStateException) {
            errno++
        }
        w.jw.endArray()
        @Assert(errno, 3)
        @Assert(w.toString(),"[[]]")
    }
}
