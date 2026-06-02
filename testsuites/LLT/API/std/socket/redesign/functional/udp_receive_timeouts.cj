/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan timeout1
// ASSERT: scan timeout2
internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runUdpServer(serverPort: AtomicUInt16) {
    try (serverSocket = UdpSocket(bindAt: 0)) {
        serverSocket.receiveBufferSize = 2304
        serverSocket.bind()
        serverPort.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        sleep(Duration.second * 8)
    }
}

main(): Int64 {
    let serverPort = AtomicUInt16(0)
    spawn {
        runUdpServer(serverPort)
    }
    sleep(Duration.millisecond * 500)

    try (socket = UdpSocket(bindAt: 0)) {
        socket.receiveTimeout = Duration.second
        socket.sendBufferSize = 2304
        socket.bind()

        socket.connect(IPSocketAddress("127.0.0.1", serverPort.load()))

        try {
            socket.receive(Array<Byte>(10, repeat: 0))
        } catch (e: SocketTimeoutException) {
            println("timeout1")
        }
        try {
            socket.receiveFrom(Array<Byte>(10, repeat: 0))
        } catch (e: SocketTimeoutException) {
            println("timeout2")
        }
    }
    return 0
}
