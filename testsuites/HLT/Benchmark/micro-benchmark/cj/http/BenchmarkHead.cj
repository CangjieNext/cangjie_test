/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 %overflow_wrapping --no-sub-pkg -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %output %run_utest_opt %run_args



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

func benchmarkHead(): Duration {
    spawn {
        serve()
    }
    sleep(Duration.second)
    let port = server.port
    let client = ClientBuilder().build()
    var startTime = DateTime.now()
    for (_ in 0..reps) {
        client.head("http://127.0.0.1:${port}/dd")
    }
    var endTime = DateTime.now()
    client.close()
    return endTime - startTime
}

func timeBenchmarkHead() {
    var perTime = Float64((benchmarkHead()).toNanoseconds()) / Float64(reps)
    println("BenchmarkHead: ${perTime.format(".2")} ns/op")
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
    timeBenchmarkHead()
    return 0
}
