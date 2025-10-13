/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import std.time.*

var fail = 0
var setTime: Array<Duration> = [Duration.second * (-1), Duration.Zero, Duration.second, Duration.second * 5,
    Duration.second * 10]
var expectTime: Array<Duration> = [Duration.second * 0, Duration.Zero, Duration.second, Duration.second * 5,
    Duration.second * 10]

main() {
    let server = ServerBuilder().addr("127.0.0.1").port(8080).build()
    server.distributor.register("/", {ctx =>})

    if (server.readTimeout != Duration.Max) {
        println("Error! Expect: 106751d23h47m16s854ms775us807nss, Actual: ${server.readTimeout}")
        fail += 1
    }

    for (i in 0..setTime.size) {
        var server = ServerBuilder().addr("127.0.0.1").port(8080).readTimeout(setTime[i]).build()
        var result = server.readTimeout
        if (result != expectTime[i]) {
            println("Error! Expect: ${expectTime[i]}, Actual: ${result}")
            fail += 1
        }
    }

    return fail
}
