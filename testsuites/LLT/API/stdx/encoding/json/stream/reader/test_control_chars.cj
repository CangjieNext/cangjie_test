/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -V %f %cmp_utest_opt -o %output
// EXEC-PIPE:%set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.io.*
import std.unittest.*
import stdx.encoding.json.stream.*

class ArrayInputStream <: InputStream {
    let data: Array<Byte>
    var offset: Int64 = 0

    init(data: Array<Byte>) {
        this.data = data
    }

    public func read(buffer: Array<Byte>): Int64 {
        var readSize: Int64 = 0
        while (offset < data.size && readSize < buffer.size) {
            buffer[readSize] = data[offset]
            offset++
            readSize++
        }
        return readSize
    }
}

@Test
class Test_jsonreader_control_chars_01 {
    func expectIllegalState(action: () -> Unit): Unit {
        try {
            action()
        } catch (_: IllegalStateException) {
            return
        }
        throw Exception("Expected an invalid JSON string to be rejected.")
    }

    @TestCase
    func test_jsonreader_rejects_unescaped_control_chars(): Unit {
        expectIllegalState({ => JsonReader(ArrayInputStream([b'\"', b'a', b'\n', b'b', b'\"'])).readValueBytes() })
        expectIllegalState({ => JsonReader(ArrayInputStream([b'\"', b'a', b'\n', b'b', b'\"'])).skip() })
        expectIllegalState({ => JsonReader(ArrayInputStream([b'{', b'\"', b'v', b'\"', b':', b'\"', b'a', b'\n', b'b', b'\"', b'}'])).readValueBytes() })
        expectIllegalState({ => JsonReader(ArrayInputStream([b'[', b'\"', b'a', b'\n', b'b', b'\"', b']'])).skip() })
        expectIllegalState({ => JsonReader(ArrayInputStream([b'\"', b'\\', b'\n', b'\"'])).readValueBytes() })
        JsonReader(ArrayInputStream([b'\"', b'a', b'\\', b'n', b'b', b'\"'])).readValueBytes()
    }
}
