/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan EMPTY_WRITE_REJECTED
// ASSERT: scan NORMAL_WRITE_OK
// ASSERT: scan server received 3

internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {
            let buf = Array<Byte>(8, repeat: 0)
            let read = client.read(buf)
            if (read == 3 && buf[0] == 1u8) {
                println("server received ${read}")
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
        socket.connect()
        // An empty payload must be rejected with IllegalArgumentException,
        // consistent with the read path and the documented contract.
        try {
            socket.write(Array<Byte>())
            println("unexpected: empty write succeeded")
        } catch (e: IllegalArgumentException) {
            if (e.message.contains("Buffer is empty")) {
                println("EMPTY_WRITE_REJECTED")
            }
        }
        socket.write([1u8, 2u8, 3u8])
        println("NORMAL_WRITE_OK")
    }
    serverFuture.get()
    return 0
}
