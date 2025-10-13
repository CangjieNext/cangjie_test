/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %overflow_wrapping  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.process.*
import stdx.net.http.*
import stdx.net.tls.*
import std.convert.*
import std.net.*
import std.collection.*

var port: UInt16 = 0
var ser = unsafe { zeroValue<Server>() }

func test(count: Int64) {
    let msg = "Hello world.\n".toArray()

    ser = ServerBuilder().addr("127.0.0.1").port(port).build()
    ser.distributor.register("/", {
        httpContext => httpContext.responseBuilder.body(msg)
    })
    spawn {
        ser.serve()
    }
    while (ser.port == 0) {
        sleep(Duration.millisecond)
    }
    var cl = ClientBuilder().build()
    for (_ in 0..count) {
        var res = cl.get("http://127.0.0.1:${ser.port}/")
        let toRead = readAll(msg.size, res)
        if (toRead != String.fromUtf8(msg)) {
            throw Exception("${toRead}!=${String.fromUtf8(msg)}!!")
        }
    }
}

func readAll(size: Int64, res: HttpResponse): String {
    let readBuffer = Array<UInt8>(size, repeat: 0)
    var len = 0
    var readLen = 0
    do {
        readLen = res.body.read(readBuffer[len..])
        len += readLen
    } while (readLen != 0)
    return String.fromUtf8(readBuffer)
}

main() {
    var n = 100
    var args = Process.current.arguments
    if (args.size == 2) {
        var num = Int64.tryParse(args[1]) ?? 0
        if (num != 0) {
            n = num
        }
    }
    test(n)
    ser.close()
}
