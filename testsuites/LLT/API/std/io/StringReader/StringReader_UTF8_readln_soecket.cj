/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./../../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC-PIPE-0: %compiler %cmp_opt %f asan.%middle -o %output
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

/*
 * Test description: Test the function `readln` of calss StringReader in Socket
 * Test API: public func readln(): Option<String>
 */

internal import std.net.*
internal import std.io.*
internal import asan.*

var port: UInt16 = 0

main(): Int64 {
    spawn {
        serve()
    }

    sleep(Duration.millisecond * 100)
    var client = TcpSocket("127.0.0.1", port)
    client.connect()

    var br = StringReader(client)
    var sb: StringBuilder = StringBuilder()
    while (true) {
        let lineStr: String = br.readln() ?? ""
        sb.append(lineStr)
        sb.append(r'|')
        if (lineStr == "666") {
            break
        }
    }

    if (sb.toString() != "111|222|333|444|555|666|") {
        return 1
    }
    client.close()
    println("ok")
    asanGC()
    return 0
}

func serve(): Unit {
    let server = TcpServerSocket(bindAt: port)
    server.bind()
    port = (server.localAddress as IPSocketAddress)?.port ?? 0
    let socket = server.accept()
    socket.write("111\n222\n333\n444\n555\n666\n".toArray())
    var buffer = Array<Byte>(1024, repeat: 0)
    socket.read(buffer)
    socket.close()
    server.close()
}
