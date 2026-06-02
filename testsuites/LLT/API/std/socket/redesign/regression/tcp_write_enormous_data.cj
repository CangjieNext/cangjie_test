/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.net.*

let DATA_SIZE = 67108864

func serverAccept(tcpServer: TcpServerSocket) {
    try (client = tcpServer.accept()) {
        client.write(Array<UInt8>(DATA_SIZE, repeat: 58))
    }
}

main() {
    let tcpServer = TcpServerSocket(bindAt: 0)
    tcpServer.bind()
    let serverPort = (tcpServer.localAddress as IPSocketAddress)?.port ?? 0
    let fut = spawn {
        serverAccept(tcpServer)
    }

    var readLen = 0
    try (clientSocket = TcpSocket("127.0.0.1", serverPort)) {
        clientSocket.connect()

        let buf = Array<UInt8>(4096, repeat: 0)

        var read = -1
        do {
            read = clientSocket.read(buf)
            readLen += read
        } while (read != 0)
    } finally {
        tcpServer.close()
    }
    fut.get()

    if (readLen == DATA_SIZE) {
        return 0
    } else {
        return 2
    }
}
