/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./createSocket
// EXEC: %compiler %cmp_opt %compile_lib_opt createSocket/create.cj -o createSocket.%middle
// EXEC: %compiler %cmp_opt %f createSocket.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.net.*
import std.time.*
import std.sync.*
import createSocket.*

@Test
class CreateSocketMain {
    @TestCase
    func testCreate(): Unit {
        sleep(Duration.second)
        let socket = D_SOCKET
        try {
            socket.connect()
        } catch (e: SocketException) {
            println(e.message)
            @Expect(e.message.contains("connect"), true)
        }
        socket.close()
    }
}
