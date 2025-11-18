/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception: registerOnShutdown

import std.io.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.runtime.*
import std.argopt.*

main() {
    let server = ServerBuilder()
        .addr("127.0.0.1")
        .port(0)
        .onShutdown({=> throw Exception("registerOnShutdown")})
        .build()
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
    server.close()

    return 0
}
