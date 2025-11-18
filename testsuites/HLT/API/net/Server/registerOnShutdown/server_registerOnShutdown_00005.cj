/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args | compare %f
// ASSERT: scan after
// ASSERT: scan-not before

import std.io.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.runtime.*
import std.argopt.*

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(0).onShutdown({=> print("before")}).build()
    server.distributor.register("/exception", {
        ctx => throw Exception("exception")
    })
    server.distributor.register("/good", {
        ctx => print("good")
    })
    spawn {
        spawn {
            server.serve()
        }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        return server
    }
    server.onShutdown({=> print("after")})
    server.close()

    return 0
}
