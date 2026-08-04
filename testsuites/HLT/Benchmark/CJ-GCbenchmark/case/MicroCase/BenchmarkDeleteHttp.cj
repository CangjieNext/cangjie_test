/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run_stdx %output %run_args 2>&1 | compare %f
// ASSERT: scan ms


import std.io.*
import std.time.*
import std.convert.*
import stdx.net.http.*
import stdx.net.tls.*
import std.net.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

var server: Server = unsafe { zeroValue<Server>() }

let reps: UInt16 = 11840

func benchmarkDelete(): Duration {
    spawn {
        serve()
    }
    sleep(Duration.second)
    let port = server.port
    let client = ClientBuilder().build()
    var startTime = DateTime.now()
    for (_ in 0..reps) {
        client.delete("http://127.0.0.1:${port}/dd")
    }
    var endTime = DateTime.now()
    client.close()
    return endTime - startTime
}

func timeBenchmarkDelete() {
    var perTime = Float64((benchmarkDelete()).toNanoseconds())
    println("BenchmarkDeleteHttp: ms = ${perTime/1000000.0}")
}

func serve() {
    let socket = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", 0))
    server = ServerBuilder().listener(socket).build()
    server.distributor.register("/dd", {
            ctx =>
            ctx.responseBuilder.body(Array<UInt8>())
            return
        })
    server.logger.level = LogLevel.OFF
    server.serve()
}

main(): Int64 {
    timeBenchmarkDelete()
    return 0
}
