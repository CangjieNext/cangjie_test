/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {
            sleep(Duration.second * 3)
        }
    }
}

main(): Int64 {
    let serverPort = AtomicUInt16(0)
    let serverFuture = spawn {
        runTcpServer(serverPort)
    }
    while (serverPort.load() == 0) {
        sleep(Duration.millisecond * 10)
    }

    try (socket = TcpSocket("localhost", serverPort.load())) {
        socket.writeTimeout = Duration.second * 2
        socket.connect()

        if (socket.remoteAddress.toString() == "127.0.0.1:${serverPort.load()}") {
            return 0
        }
    }

    serverFuture.get()

    return 100
}
