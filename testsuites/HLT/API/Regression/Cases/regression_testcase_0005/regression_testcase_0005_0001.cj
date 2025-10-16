/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
/*
 * Brief: Test Server can correctly process the request whose method is OPTIONS, path is *.
 *
 * Step: Create request whose method is OPTIONS.
 *
 * Expect: The status code of the response packet is 200.
 */

// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %n.%suffix %run_args

import std.io.*
import stdx.net.http.*
import stdx.net.tls.*
import std.sync.*
import std.runtime.*
import std.argopt.*

var count: AtomicInt64 = AtomicInt64(0)
var server = unsafe { zeroValue<Server>() }

func serve() {
    server = ServerBuilder().addr("127.0.0.1").port(0).build()
    server.distributor.register("/", {
        httpContext => if (httpContext.request.method == "OPTIONS") {
            count.fetchAdd(1)
        }
    })

    spawn {
        server.serve()
    }
    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
}

func client(): String {
    let client = ClientBuilder().build()
    var req = HttpRequestBuilder()
        .method("OPTIONS")
        .url("http://127.0.0.1:${server.port}/")
        .header("Connection", "close")
        .build()

    var res = client.send(req)

    return res.toString()
}

main(): Int64 {
    serve()

    client()

    if (count.load() == 1) {
        return 0
    } else {
        return 1
    }
}
