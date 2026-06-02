/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import std.fs.*
import std.regex.*

var file = File("./test.txt", ReadWrite)
var bis = BufferedOutputStream(file)

@Test
class Test_outputStream_close {
    public override func beforeEach(): Unit {
        file = File("./test.txt", ReadWrite)
        bis = BufferedOutputStream(file)
    }

    public override func afterEach(): Unit {
        remove("./test.txt")
    }

    @TestCase
    func test_stream_close(): Unit {
        // check status before close
        @Expect(bis.isClosed(), false)
        @Expect(file.isClosed(), false)
        readToEnd(file)
        bis.write([65u8, 66u8, 67u8])

        bis.close()

        // check status after close
        @Expect(bis.isClosed(), true)
        @Expect(file.isClosed(), true)
    }

    @TestCase
    func test_file_close(): Unit {
        // check status before close
        @Expect(bis.isClosed(), false)
        @Expect(file.isClosed(), false)
        readToEnd(file)
        bis.write([65u8, 66u8, 67u8])

        file.close()

        // check status after close
        @Expect(bis.isClosed(), true)
        @Expect(file.isClosed(), true)
    }

    @TestCase
    func test_close_and_read(): Unit {
        var cnt = 0

        bis.close()

        try {
            readToEnd(file)
        } catch (e: FSException) {
            cnt++
            @Assert(Regex("^The file `.+` not opened, can not to read.$").matches(e.message))
        }
        @Expect(cnt, 1)

        //multi close
        file.close()
        bis.close()
        @Expect(bis.isClosed(), true)
        @Expect(file.isClosed(), true)
    }
}
