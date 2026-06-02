/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not FAIL
// ASSERT: scan END

internal import std.net.*
internal import std.time.*
internal import std.sync.*
internal import std.fs.*
internal import std.random.*
internal import std.process.*

foreign {
    func free(ptr: CPointer<Unit>): Unit

    func malloc(size: UIntNative): CPointer<Unit>
}

let SOCK_REUSEADDR_SIZE: UIntNative = sizeOf<Int32>()

extend UnixDatagramSocket {
    mut prop customReuseAddr: Bool {
        get() {
            var result: Int32 = -1

            unsafe {
                let memory = malloc(SOCK_REUSEADDR_SIZE)
                let ptr = CPointer<Int32>(memory)

                let sizes = Array<UIntNative>(1, repeat: SOCK_REUSEADDR_SIZE)
                let sizesCaptured = acquireArrayRawData(sizes)
                try {
                    getSocketOption(SocketOptions.SOL_SOCKET, SocketOptions.SO_REUSEADDR, CPointer(ptr),
                        sizesCaptured.pointer)

                    result = ptr.read()
                } finally {
                    free(memory)
                    releaseArrayRawData(sizesCaptured)
                }
            }

            return match (result) {
                case 1 | 4 => true
                case 0 => return false
                case _ => throw Exception("Unknown reuseAddr raw value: ${result}")
            }
        }
        set(value) {
            unsafe {
                let memory = malloc(SOCK_REUSEADDR_SIZE)
                let ptr = CPointer<Int32>(memory)

                try {
                    ptr.write(match (value) {
                        case true => Int32(1)
                        case false => Int32(0)
                    })

                    setSocketOption(SocketOptions.SOL_SOCKET, SocketOptions.SO_REUSEADDR, CPointer(ptr),
                        SOCK_REUSEADDR_SIZE)
                } finally {
                    free(memory)
                }
            }
        }
    }

    // use IntNative
    mut prop customSNDBSize: Int64 {
        get() {
            Int64(getSocketOptionIntNative(SocketOptions.SOL_SOCKET, SocketOptions.SO_SNDBUF))
        }
        set(value) {
            setSocketOptionIntNative(SocketOptions.SOL_SOCKET, SocketOptions.SO_SNDBUF, IntNative(value))
        }
    }

    // use Bool
    mut prop customDontRoute: Bool {
        get() {
            getSocketOptionBool(SocketOptions.SOL_SOCKET, SocketOptions.SO_KEEPALIVE)
        }
        set(value) {
            setSocketOptionBool(SocketOptions.SOL_SOCKET, SocketOptions.SO_KEEPALIVE, value)
        }
    }
}

func createTempFile(): String {
    let tempDir: Path = Process.current.tempDirectory

    let index: String = Random().nextUInt64().toString()

    return tempDir.join("tmp${index}").toString()
}

main(): Int64 {
    try (socket = UnixDatagramSocket(bindAt: createTempFile())) {
        socket.bind()

        let oldValue = socket.customReuseAddr
        socket.customReuseAddr = !oldValue

        if (socket.customReuseAddr == oldValue) {
            println("FAIL 1: incorrect value readed from customReuseAddr")
        }

        // getSocketOptionIntNative, setSocketOptionIntNative
        if (socket.customSNDBSize != socket.sendBufferSize) {
            println("FAIL 3: incorrect value readed from customSNDBSize")
        }
        // result unpredictable, so just setting
        socket.customSNDBSize = 10000

        // setSocketOptionBool, getSocketOptionBool
        let dontRoute = socket.customDontRoute
        socket.customDontRoute = !dontRoute
        if (socket.customDontRoute == dontRoute) {
            println("FAIL 4: incorrect value readed from manualQuickAck")
        }

        println("END")
    }

    return 0
}
