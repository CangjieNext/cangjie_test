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
 *  测试JsonWriter的基础功能
 */
@Test
class Test_JsonWriter_Basic {

    //测试直接写value，name
    @TestCase
    func test_startValue(): Unit {
        let w = writer()
        try {
            w.jw.writeValue(1)
        } catch (_: IllegalStateException) {
            @Assert(false)
        }

        try {
            w.jw.writeName("v1")
        } catch (_: IllegalStateException) {
            return
        }
        @Assert(false)
    }

    //测试多个topValue
    @TestCase
    func test_multiTopValue(): Unit {
        let w = writer()
        var errno = 0
        w.jw.startArray()
        w.jw.endArray()
        try {
            w.jw.startArray()
        } catch (_: IllegalStateException) {
            errno++
        }

        try {
            w.jw.startObject()
        } catch (_: IllegalStateException) {
            errno++
        }

        try {
            let w2 = writer()
            w2.jw.writeValue(1)
            w2.jw.writeValue(2)
        } catch (_: IllegalStateException) {
            errno++
        }

        @Assert(3, errno)
    }

    //测试 startArray 是否正确
    @TestCase
    func test_startArray(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.flush()
        @Expect("[",w.toString())
    }

    //测试 endArray 正确
    @TestCase
    func test_endArray(): Unit {
        let w = writer()
        w.jw.startArray()
        w.jw.endArray()
        w.jw.flush()
        @Expect("[]",w.toString())
    }

    //测试 endArray 不正确的场景
    @TestCase
    func test_endArray_err(): Unit {
        let w = writer()
        try {
            w.jw.endArray()
        } catch (e: IllegalStateException) {
            return
        }
        @Assert(false)
    }

    //测试 startObject 是否正确
    @TestCase
    func test_startObject(): Unit {
        let w = writer()
        w.jw.startObject()
        w.jw.flush()
        @Expect("{",w.toString())
    }

    //测试 endObject 正确
    @TestCase
    func test_endObject(): Unit {
        let w = writer()
        w.jw.startObject()
        w.jw.endObject()
        w.jw.flush()
        @Expect("{}",w.toString())
    }

    //测试 endArray 不正确的场景
    @TestCase
    func test_endObject_err(): Unit {
        let w = writer()
        try {
            w.jw.endObject()
        } catch (e: IllegalStateException) {
            return
        }
        @Assert(false)
    }

    //组合测试
    @TestCase
    func test_startArray_endObject() {
        let w = writer()
        try {
            w.jw.startArray()
            w.jw.endObject()
        } catch (e: IllegalStateException) {
            return
        }
        @Assert(false)
    }

    @TestCase
    func test_startObject_endArray() {
        let w = writer()
        try {
            w.jw.startObject()
            w.jw.endArray()
        } catch (e: IllegalStateException) {
            return
        }
        @Assert(false)
    }
}
