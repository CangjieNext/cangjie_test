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

foreign {
    func free(ptr: CPointer<Unit>): Unit

    func malloc(size: UIntNative): CPointer<Unit>
}

let SOCK_TCP_NODELAY: Int32 = 0x0001
let SOCK_NODELAY_SIZE: UIntNative = sizeOf<Int32>()

extend TcpSocket {
    mut prop customNoDelay: Bool {
        get() {
            var result: Int32 = -1

            unsafe {
                let memory = malloc(SOCK_NODELAY_SIZE)
                let ptr = CPointer<Int32>(memory)
                let sizes = Array<UIntNative>(1, repeat: SOCK_NODELAY_SIZE)
                let sizesCaptured = acquireArrayRawData(sizes)
                ptr.write(0)
                try {
                    getSocketOption(SocketOptions.IPPROTO_TCP, SOCK_TCP_NODELAY, CPointer(ptr), sizesCaptured.pointer)

                    result = ptr.read()
                } finally {
                    free(memory)
                    releaseArrayRawData(sizesCaptured)
                }
            }

            return match (result) {
                case 1 | 4 => true
                case 0 => return false
                case _ => throw Exception("Unknown noDelay raw value: ${result}")
            }
        }
        set(value) {
            unsafe {
                let memory = malloc(SOCK_NODELAY_SIZE)
                let ptr = CPointer<Int32>(memory)

                try {
                    ptr.write(match (value) {
                        case true => Int32(1)
                        case false => Int32(0)
                    })

                    setSocketOption(SocketOptions.SOL_SOCKET, SOCK_TCP_NODELAY, CPointer(ptr), SOCK_NODELAY_SIZE)
                } finally {
                    free(memory)
                }
            }
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
    spawn {
        runTcpServer(port)
    }
    sleep(Duration.second)

    try (socket = TcpSocket("127.0.0.1", port.load())) {
        socket.connect()

        let oldValue = socket.customNoDelay
        if (socket.customNoDelay != socket.noDelay) {
            println("FAIL 1: incorrect value readed from customNoDelay")
        }
        socket.customNoDelay = !socket.noDelay

        if (socket.customNoDelay != socket.noDelay || socket.customNoDelay == oldValue) {
            println("FAIL 2: incorrect value readed from customNoDelay")
        }
    }

    return 0
}
