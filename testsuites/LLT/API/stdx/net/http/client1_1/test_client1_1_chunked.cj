/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import asan.*

@Test
class TestClient1_1Chunked {
    // http url without port or proxy
    @TestCase
    func client1_1Chunked(): Unit {
        let request = HttpRequestBuilder()
                        .header("transfer-encoding", ",,,")
                        .url("http://127.0.0.1:80/dd")
                        .build()
        
        let client = ClientBuilder()
                        .build()
	
        try {
            client.send(request)
        } catch (e: Exception) {
            println(e.message)
            @Expect(e.message.contains("The last value of transfer-encoding must be chunked."))
        }
        client.close()
        println("ok")
    }
}

/* SCAN-IN
ok
 */
