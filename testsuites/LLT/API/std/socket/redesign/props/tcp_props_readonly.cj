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
    sleep(Duration.second)

    try (tcpSocket = TcpSocket("127.0.0.1", port.load())) {
        tcpSocket.connect()

        // remote address
        let ra = tcpSocket.remoteAddress

        if (ra.toString() != "127.0.0.1:${port.load()}") {
            return 8
        }

        // local address
        let la = (tcpSocket.localAddress as IPSocketAddress) ?? throw Exception("invalid localAddress")
        if (la.address.toString() != "127.0.0.1") {
            return 7
        }
        if (la.port == port.load()) {
            return 6
        }
        return 0
    }

    return 8
}
