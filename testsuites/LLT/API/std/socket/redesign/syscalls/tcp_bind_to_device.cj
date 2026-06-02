/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE:  ./filter.sh
// (Linux) EXEC: %compiler %cmp_opt -o %output %f
// run with *strace* to check that the correct system calls were made:
// (Linux) EXEC-PIPE: strace --trace=socket,setsockopt -f -tt -qqq sh -c "%run %run_opt %output %run_args" 2>&1 | ./filter.sh | compare %f
// syscalls 'setsockopt' with correct options:
// (Linux) ASSERT: regex .*socket[(]AF_INET[,] .*SOCK_STREAM.*[)].* [=] .*[0-9]+
// SOCK_BINDTODEVICE is set
// (Linux) ASSERT: regex .*setsockopt[(].*SOL_SOCKET.*SO_BINDTODEVICE.*dvice123.*[)].*
// (Linux) ASSERT: scan expected exception, due to an unknown device

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
    sleep(Duration.millisecond * 200)

    try (socket = TcpSocket("127.0.0.1", port.load())) {
        socket.bindToDevice = "dvice123"

        try {
            socket.connect()
        } catch (e: SocketException) {
            println("expected exception, due to an unknown device")
        }
    }

    return 0
}
