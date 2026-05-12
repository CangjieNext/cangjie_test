/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %output %f

import std.io.*
import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import stdx.encoding.url.*

var server = unsafe { zeroValue<Server>() }

func serve() {
    for (i in 8091..8191) {
        server = ServerBuilder().addr("127.0.0.1").port(UInt16(i)).build()
        server
            .distributor
            .register("/", {
                httpContext => httpContext.responseBuilder.body("Getting request from client".toArray())
            })

        spawn {
            server.serve()
        }
    }
}

main(): Int64 {
    serve()

    while (true) {
        let client = ClientBuilder().build()
        var b = ByteBuffer()
        var msg = "Request from client"
        b.write(msg.toArray())
        for (i in 8091..8191) {
            var a = client.post("http://127.0.0.1:${UInt16(i)}/", b)
            println(a)
        }
    }

    return 0
}
