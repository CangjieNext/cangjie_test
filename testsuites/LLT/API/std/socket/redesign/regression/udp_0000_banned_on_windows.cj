/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan unable sendTo
// ASSERT: scan unable connect

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
    sleep(Duration.millisecond * 200)

    try (udpSocket = UdpSocket(bindAt: 0)) {
        udpSocket.bind()

        try {
            udpSocket.sendTo(IPSocketAddress(IPv4Address.unspecified, 0), [1u8, 2u8, 3u8])
        } catch (e: SocketException) {
            println("unable sendTo")
        }

        try {
            udpSocket.connect(IPSocketAddress("0.0.0.0", serverPort.load()))
        } catch (e: SocketException) {
            println("unable connect")
        }

        return 0
    }

    return 100
}
