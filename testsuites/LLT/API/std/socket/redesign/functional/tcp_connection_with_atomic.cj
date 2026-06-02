/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan received

internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(3, repeat: 0)
            let read = client.read(buf)
            if (read == 3 && buf == [1u8, 2u8, 3u8]) {
                println("received")
            }
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

    try (socket = TcpSocket("127.0.0.1", serverPort.load())) {
        socket.writeTimeout = Duration.second * 2
        socket.connect()

        socket.write([1u8, 2u8, 3u8])
    }

    serverFuture.get()

    return 0
}
