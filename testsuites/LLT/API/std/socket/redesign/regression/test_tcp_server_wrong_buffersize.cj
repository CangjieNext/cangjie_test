/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

/*
 * Test description: Test sendBufferSize and receiveBufferSize with
 * different inputs in tcp server or socket
 * Test API: public mut prop sendBufferSize: Int64
 *           public mut prop receiveBufferSize: Int64
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var port = AtomicUInt16(0)
var ser = Option<TcpServerSocket>.None

func startServer(): Unit {
    var server = TcpServerSocket(bindAt: 0)
    server.bind()
    port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
    ser = Option<TcpServerSocket>.Some(server)
}

@When[os == "Windows"]
var localBindAddress = "127.0.0.1"
@When[os != "Windows"]
var localBindAddress = "0.0.0.0"

main() {
    spawn {
        startServer()
    }
    sleep(Duration.second)

    var client = TcpSocket(localBindAddress, port.load())
    try {
        ser.getOrThrow().sendBufferSize = -100
    } catch (e: IllegalArgumentException) {
        assertEqual("Expected:", "Actual:", "Buffer size should be positive, got -100.", e.message)
    }

    try {
        ser.getOrThrow().receiveBufferSize = -100
    } catch (e: IllegalArgumentException) {
        assertEqual("Expected:", "Actual:", "Buffer size should be positive, got -100.", e.message)
    }
}
