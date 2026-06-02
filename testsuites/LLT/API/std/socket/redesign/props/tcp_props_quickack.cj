/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (not Darwin)EXEC: %compiler %cmp_opt -o %output %f
// (not Darwin)RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*
internal import std.time.*
internal import std.sync.*

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {}
    }
}

main(): Int64 {
    let port = AtomicUInt16(0)
    spawn {
        runTcpServer(port)
    }
    sleep(Duration.millisecond * 300)

    try (tcpSocket = TcpSocket("127.0.0.1", port.load())) {
        tcpSocket.connect()

        tcpSocket.quickAcknowledge = true
        if (tcpSocket.quickAcknowledge != true) {
            return 2
        }

        tcpSocket.quickAcknowledge = false
        if (tcpSocket.quickAcknowledge != false) {
            return 3
        }

        return 0
    }

    return 100
}
