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

let TCP_NODELAY: Int32 = 0x0001

extend TcpSocket {
    mut prop customNoDelay: Int64 {
        get() {
            Int64(getSocketOptionIntNative(SocketOptions.IPPROTO_TCP, TCP_NODELAY))
        }
        set(value) {
            setSocketOptionIntNative(SocketOptions.IPPROTO_TCP, TCP_NODELAY, IntNative(value))
        }
    }
}

func runTcpServer(port: AtomicUInt16) {
    try (serverSocket = TcpServerSocket(bindAt: 0)) {
        serverSocket.bind()
        port.store((serverSocket.localAddress as IPSocketAddress)?.port ?? 0)
        try (client = serverSocket.accept()) {}
    }
}

main(): Int64 {
    let port = AtomicUInt16(0)
    let fut = spawn {
        runTcpServer(port)
    }
    sleep(Duration.second)

    try (socket = TcpSocket("127.0.0.1", port.load())) {
        socket.connect()

        let kaCount = socket.customNoDelay
        if (socket.customNoDelay != kaCount) {
            return 1
        }
        socket.customNoDelay = 1
        if (socket.customNoDelay != 1 && socket.customNoDelay != 4) {
            return 2
        }

        fut.get()
    }

    return 0
}
