/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 --no-sub-pkg %overflow_wrapping %f -o %output

import stdx.net.http.*
import std.net.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

let bodySizes: Array<Int64> =[32, 256, 2048, 16384, 131072, 1048576, 8388608, 67108864]
var arr = Array<UInt8>(4 * 1024, repeat: 0)

func setHandlerGet(server: Server, bodySize: Int64): Unit {
    let resp = Array<UInt8>(bodySize, repeat: 58)
    server.distributor.register("/get${bodySize}", {
        ctx => ctx.responseBuilder.body(resp)
        return
    })
}

main(): Unit {
    let socket = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", 62001))
    var server = ServerBuilder().listener(socket).maxRequestBodySize(0).build()
    for (bodySize in bodySizes) {
        setHandlerGet(server, bodySize)
    }
    server.distributor.register("/post", { ctx =>
        while (ctx.request.body.read(arr) != 0) {}
        ctx.responseBuilder.body(Array<UInt8>())
        return
    })

    server.logger.level = LogLevel.OFF
    server.serve()
}