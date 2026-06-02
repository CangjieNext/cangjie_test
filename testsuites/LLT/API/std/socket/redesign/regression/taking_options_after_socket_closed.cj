/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.net.*
import std.time.*
import std.sync.*

var ser = Option<TcpServerSocket>.None

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        ser = serverSocket
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {}
    }
}

main() {
    let port = AtomicUInt16(0)
    spawn {
        runTcpServer(port)
    }
    sleep(Duration.second)
    try (tcpSocket = TcpSocket("127.0.0.1", port.load())) {
        tcpSocket.readTimeout = Duration.second
        tcpSocket.connect()
        ser.getOrThrow().close()
        tcpSocket.close()

        var thrownExceptionCount = 0

        try {
            tcpSocket.readTimeout
        } catch (e: SocketException) {
            thrownExceptionCount++
        }
        try {
            tcpSocket.writeTimeout
        } catch (e: SocketException) {
            thrownExceptionCount++
        }
        try {
            tcpSocket.remoteAddress
        } catch (e: SocketException) {
            thrownExceptionCount++
        }
        try {
            tcpSocket.localAddress
        } catch (e: SocketException) {
            thrownExceptionCount++
        }
        try {
            tcpSocket.keepAlive
        } catch (e: SocketException) {
            thrownExceptionCount++
        }

        @Assert(thrownExceptionCount == 5)
    }
    0
}
