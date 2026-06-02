// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: ../../../API/stdx/net/tls/files
// (Linux and CJNATIVE) DEPENDENCE: ./../../../API/asan
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f asan.%middle -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan n = 196218, pass

internal import std.net.*
internal import asan.*

var port: UInt16 = 0
let sendSize = 1982

func startServer(): Unit {
    var server = TcpServerSocket(bindAt: 0)
    server.bind()
    port = (server.localAddress as IPSocketAddress)?.port ?? 0
    var socket = server.accept()
    var buf = Array<UInt8>(sendSize / 5, repeat: 0)
    var sum = 0
    var n = 0
    while (sum < sendSize) {
        var readLen = socket.read(buf)
        if (readLen > 0) {
            sum += readLen
            for (i in 0..readLen) {
                n += Int64(buf[i])
            }
        } else {
            break
        }
    }
    if (n == 99 * sendSize) {
        println("n = ${n}, pass!")
    }
    socket.close()
    server.close()
}

main(): Int64 {
    spawn {
        try {
            startServer()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
    sleep(Duration.millisecond * 100) // 100 ms
    var client = TcpSocket("127.0.0.1", port)
    client.connect()
    var buf = Array<UInt8>(sendSize, repeat: 99)
    client.write(buf)
    sleep(Duration.second) // 1000 ms
    client.close()
    asanGC()
    return 0
}
