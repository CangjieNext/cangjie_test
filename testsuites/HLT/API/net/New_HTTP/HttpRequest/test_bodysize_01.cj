/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test bodySize function
 * Test API: public prop bodySize: Option<Int64>
 */

import stdx.net.http.*
import std.io.*

public class test_inputStream <: InputStream {
    public func read(buffer: Array<Byte>): Int64 {
        return -1
    }
}

@Test
class Test_HttpRequest_BodySize_01 {
    // 长度未设置--Some(0)
    @TestCase
    func test_bodysize_01(): Unit {
        var req1 = HttpRequestBuilder().build()
        @Expect(req1.bodySize, 0)
    }

    // 长度:已知--按照content-length和body推断
    @TestCase
    func test_bodysize_02(): Unit {
        var req1 = HttpRequestBuilder()
            .header("Content-Length", "2000")
            .body(Array<UInt8>(1000, repeat: UInt8(10)))
            .header("Content-Length", "3000")
            .build()
        @Expect(req1.bodySize, 1000)
    }

    // 长度：已知--按照content-length和body推断
    @TestCase
    func test_bodysize_03(): Unit {
        var ins = ByteBuffer(10000)
        ins.write(Array<Byte>(1000, repeat: UInt8(2)))
        var req1 = HttpRequestBuilder()
            .header("Content-Length", "2000")
            .body(ins)
            .header("Content-Length", "3000")
            .build()
        @Expect(req1.bodySize, 1000)
    }

    // 长度：未知 -- 返回None
    @TestCase
    func test_bodysize_04(): Unit {
        var ins = test_inputStream()
        var req1 = HttpRequestBuilder()
            .header("Content-Length", "2000")
            .body(ins)
            .header("Content-Length", "3000")
            .build()
        @Expect(req1.bodySize, None)
    }
}
