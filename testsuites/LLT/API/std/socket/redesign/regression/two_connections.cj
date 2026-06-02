/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*

func tcpServerAccept(serverSocket: TcpServerSocket) {
    try (client = serverSocket.accept()) {}
}

main(): Int64 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    serverSocket.bind()
    let serverPort = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
    let future = spawn {
        tcpServerAccept(serverSocket)
    }

    try (socket = TcpSocket("127.0.0.1", serverPort)) {
        socket.connect()
        future.get()
        try {
            socket.connect()
        } catch (e: SocketException) {
            return 0
        }
    } finally {
        serverSocket.close()
    }

    return 1
}
