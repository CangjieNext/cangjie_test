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

        // read timeout
        if (tcpSocket.readTimeout != None<Duration>) {
            return 2
        }
        tcpSocket.readTimeout = Duration.second
        if (tcpSocket.readTimeout != Some(Duration.second)) {
            return 3
        }

        // write timeout
        if (tcpSocket.writeTimeout != None<Duration>) {
            return 4
        }
        tcpSocket.writeTimeout = Duration.second
        if (tcpSocket.writeTimeout != Some(Duration.second)) {
            return 5
        }

        // no delay: true by default
        if (tcpSocket.noDelay != true) {
            return 6
        }
        tcpSocket.noDelay = false
        if (tcpSocket.noDelay != false) {
            return 7
        }

        // linger
        tcpSocket.linger = Duration.minute
        if (tcpSocket.linger != Duration.minute) {
            return 10
        }

        if (tcpSocket.sendBufferSize <= 0) {
            return 11
        }
        tcpSocket.sendBufferSize = 2304

        if (tcpSocket.receiveBufferSize <= 0) {
            return 12
        }
        tcpSocket.receiveBufferSize = 2304

        if (let Some(nint) <- tcpSocket.bindToDevice) {
            return 13
        }

        try {
            tcpSocket.bindToDevice = "???"
            return 14 // we are connected so can't apply it
        } catch (expected: SocketException) {
        }

        return 0
    }

    return 100
}
