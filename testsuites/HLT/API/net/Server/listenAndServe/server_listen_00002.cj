/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run_stdx %output %run_args | compare %f
// ASSERT: scan z is 2!
// ASSERT: scan-not Log-Err

import std.io.*
import stdx.net.http.*
//import stdx.net.tls.common.*
import stdx.net.tls
//import stdx.crypto.kit
import std.runtime.*
import std.argopt.*

var z = 0

main() {
    let server1 = ServerBuilder().addr("127.0.0.1").port(0).build()
    server1.distributor.register(
        "/",
        {
            ctx =>
            z += 1
            print("z is ${z}!\n")
        }
    )
    spawn {server1.serve()}
    while (server1.port == 0) {
        sleep(Duration.millisecond)
    }

    let server2 = ServerBuilder().addr("127.0.0.1").port(0).build()
    server2.distributor.register(
        "/",
        {
            ctx =>
            z += 1
            print("z is ${z}!\n")
        }
    )
    spawn {server2.serve()}
    while (server2.port == 0) {
        sleep(Duration.millisecond)
    }

    let c1 = ClientBuilder().build()
    c1.get("http://127.0.0.1:${server1.port}")

    let c2 = ClientBuilder().build()
    c2.get("http://127.0.0.1:${server2.port}")

    c1.close()
    c2.close()

    return 0
}
