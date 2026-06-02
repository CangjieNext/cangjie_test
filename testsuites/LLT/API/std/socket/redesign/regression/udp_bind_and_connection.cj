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

func runUpdServer(serverPort: AtomicUInt16) {
    try (serverSocket = UdpSocket(bindAt: 0)) {
        serverSocket.bind()
        serverPort.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)

        sleep(Duration.second * 2)
    }
}

main(): Int64 {
    let serverPort = AtomicUInt16(0)
    spawn {
        runUpdServer(serverPort)
    }
    sleep(Duration.second)

    try (udpSocket = UdpSocket(bindAt: 0)) {
        // bind() must be before the connection
        udpSocket.bind()
        udpSocket.connect(IPSocketAddress("127.0.0.1", serverPort.load()))
    }

    return 0
}
