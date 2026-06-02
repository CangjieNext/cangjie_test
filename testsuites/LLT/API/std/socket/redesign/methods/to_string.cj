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
internal import std.fs.*
internal import std.random.*
internal import std.posix.*
internal import std.collection.ArrayList

func test(): Int64 {
    try (socket = TcpServerSocket(bindAt: 0)) {
        println(socket)
        if (socket.toString() != "TcpServerSocket(unconnected, unbound)") {
            return 1
        }
        socket.bind()

        println(socket)
        let serverAddr = socket.localAddress as IPSocketAddress ?? throw SocketException(
            "invalid localAddress ${socket.localAddress}")
        if (socket.toString() != "TcpServerSocket(bound at ${serverAddr})") {
            println(socket)
            return 2
        }

        try (client = TcpSocket("127.0.0.1", serverAddr.port)) {
            println(client)
            if (client.toString() != "TcpSocket(unconnected, unbound)") {
                return 3
            }
            client.connect()

            println(client)
            let local = client.localAddress as IPSocketAddress ?? throw SocketException(
                "invalid localAddress ${client.localAddress}")
            if (client.toString() != "TcpSocket(${local} -> ${client.remoteAddress})") {
                return 4
            }
        }
    }

    try (udp = UdpSocket(bindAt: 0)) {
        println(udp)
        if (udp.toString() != "UdpSocket(unconnected, unbound)") {
            return 5
        }

        udp.bind()
        let addr = udp.localAddress
        println(udp)

        if (udp.toString() != "UdpSocket(bound at ${addr})") {
            return 6
        }

        try (udp2 = UdpSocket(bindAt: 0)) {
            udp2.bind()
            udp.connect(IPSocketAddress("127.0.0.1", (udp2.localAddress as IPSocketAddress)?.port ?? 0))
            println(udp)
            if (udp.toString() != "UdpSocket(${udp.localAddress} -> ${udp.remoteAddress.getOrThrow()})") {
                println("UdpSocket(${udp.localAddress} -> ${udp.remoteAddress})")
                return 7
            }

            udp.disconnect()
            println(udp)
            if (udp.toString() != "UdpSocket(bound at ${udp.localAddress})") {
                return 7
            }
        }
    }
    return 0
}

main(): Int64 {
    test()
}
