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

func runUdpServer(port: AtomicUInt16) {
    try (serverSocket = UdpSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
    }
}

@When[os != "Windows"]
var isWindows = false
@When[os == "Windows"]
var isWindows = true

main(): Int64 {
    let port = AtomicUInt16(0)
    spawn {
        runUdpServer(port)
    }
    sleep(Duration.second)

    try (udpSocket = UdpSocket(bindAt: port.load())) {
        udpSocket.bind()

        // receiveTimeout
        if (udpSocket.receiveTimeout != None<Duration>) {
            return 2
        }
        udpSocket.receiveTimeout = Some(Duration.second)
        if (udpSocket.receiveTimeout != Some(Duration.second)) {
            return 3
        }

        // sendTimeout
        if (udpSocket.sendTimeout != None<Duration>) {
            return 4
        }
        udpSocket.sendTimeout = Some(Duration.second)
        if (udpSocket.sendTimeout != Some(Duration.second)) {
            return 5
        }
        if (!isWindows) {
            udpSocket.reusePort = true
            if (udpSocket.reusePort == false) {
                return 6
            }
            udpSocket.reusePort = false
            if (udpSocket.reusePort == true) {
                return 7
            }
        }

        udpSocket.reuseAddress = true
        if (udpSocket.reuseAddress == false) {
            return 8
        }
        udpSocket.reuseAddress = false
        if (udpSocket.reuseAddress == true) {
            return 9
        }

        if (udpSocket.sendBufferSize <= 0) {
            return 10
        }
        udpSocket.sendBufferSize = 2304

        if (udpSocket.receiveBufferSize <= 0) {
            return 11
        }
        udpSocket.receiveBufferSize = 2304

        return 0
    }

    return 100
}
