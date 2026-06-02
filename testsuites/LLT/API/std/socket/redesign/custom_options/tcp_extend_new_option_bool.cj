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

let SOCK_TCP_NODELAY: Int32 = 0x0001

extend TcpSocket {
    mut prop manualNoDelay: Bool {
        get() {
            getSocketOptionBool(SocketOptions.IPPROTO_TCP, SOCK_TCP_NODELAY)
        }
        set(value) {
            setSocketOptionBool(SocketOptions.IPPROTO_TCP, SOCK_TCP_NODELAY, value)
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

/**
SOCK_TCP_NODELAY is not available on windows and throws exception
 */
main(): Int64 {
    let port = AtomicUInt16(0)
    spawn {
        runTcpServer(port)
    }
    sleep(Duration.second)

    try (socket = TcpSocket("127.0.0.1", port.load())) {
        socket.connect()

        let noDelay = socket.manualNoDelay
        socket.manualNoDelay = !noDelay
        if (socket.manualNoDelay == noDelay) {
            return 2
        }

        sleep(Duration.second)
    }

    return 0
}
