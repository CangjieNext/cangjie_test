/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
 * Test description:
 *       Test the set api and get api of the socket options tcp_quickack and tcp_nodelay
 * Test API:
 *       Socket:
 *       public mut prop noDelay: Bool
 *       public mut prop quickAck: Bool
 */

internal import std.net.*

var port: UInt16 = 0

func serve(): Int64 {
    var server = TcpServerSocket(bindAt: port)
    server.bind()
    port = (server.localAddress as IPSocketAddress)?.port ?? 0
    var _ = server.accept()
    server.close()
    return 0
}

@When[os != "Windows" && os != "macOS"]
func setOptions(socket: TcpSocket): Int64 {
    socket.noDelay = true
    if (!socket.noDelay) {
        return 2
    }
    socket.quickAcknowledge = true
    if (!socket.quickAcknowledge) {
        return 3
    }
    return 0
}

@When[os == "Windows" || os == "macOS"]
func setOptions(socket: TcpSocket): Int64 {
    socket.noDelay = true
    if (!socket.noDelay) {
        return 2
    }
    return 0
}

main(): Int64 {
    spawn {
        serve()
    }
    sleep(Duration.millisecond * 100)
    var socket = TcpSocket("127.0.0.1", port)
    if (setOptions(socket) != 0) {
        return 1
    }
    socket.connect()
    socket.close()
    return 0
}
