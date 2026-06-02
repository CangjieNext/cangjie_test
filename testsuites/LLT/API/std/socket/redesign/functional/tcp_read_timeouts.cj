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

internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {
            client.receiveBufferSize = 2304
            sleep(Duration.second * 4)
        }
    }
}

main(): Int64 {
    let port = AtomicUInt16(0)
    spawn {
        runTcpServer(port)
    }
    sleep(Duration.millisecond * 500)

    try (socket = TcpSocket("127.0.0.1", port.load())) {
        socket.readTimeout = Duration.second
        socket.sendBufferSize = 2304
        socket.connect()

        try {
            socket.read(Array<Byte>(10, repeat: 0))
        } catch (e: SocketTimeoutException) {
            println("timeout1")
        }
    }

    return 0
}
