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

        // no keepAlive by default
        if (tcpSocket.keepAlive.toString() != "None") {
            return 2
        }

        tcpSocket.keepAlive = SocketKeepAliveConfig()

        // default keep alive
        var ka = tcpSocket.keepAlive ?? return 2
        if (ka.idle != (Duration.second * 45) || ka.interval != (Duration.second * 5) || ka.count != 5) {
            return 3
        }

        // updated keepAlive
        tcpSocket.keepAlive = SocketKeepAliveConfig(interval: Duration.second * 7)

        ka = tcpSocket.keepAlive ?? return 4
        if (ka.idle != (Duration.second * 45) || ka.interval != Duration.second * 7 || ka.count != 5) {
            return 4
        }

        return 0
    }

    return 5
}
