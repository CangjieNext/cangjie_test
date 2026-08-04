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
let buf = Array<Byte>(4096, repeat: 0)

// High-load data running core dump

let nums: Array<Int64> =[32, 256, 2048, 16384, 131072, 1048576, 8388608, 67108864]


let repsAll:Array<Int64> =[11406, 9939, 10000, 5348, 1890, 608, 60 , 12, 1, 1]
let len: Int64 = nums.size

func benchmarkClientGet(num: Int64) {
    spawn {
        serve(num)
    }
    sleep(Duration.second)

    let port = server.port
    let client = ClientBuilder().build()
    var reps = repsAll[num]
    for (_ in 0..reps) {
        let rsp = client.get("http://127.0.0.1:${port}/dd")
        while (rsp.body.read(buf) != 0) {}
    }
    client.close()
}

func serve(num: Int64) {
    let resp: Array<UInt8> = Array<UInt8>(nums[num], repeat: 58)
    let socket = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", 0))
    server = ServerBuilder().listener(socket).build()
    server.distributor.register("/dd", {
        ctx =>
            ctx.responseBuilder.body(resp)
            return
        })
    server.logger.level = LogLevel.OFF
    server.serve()
}

main(): Int64 {
    var startTime = DateTime.now()
    for (i in 0..len) {
        benchmarkClientGet(i)
    }
    var perTime = DateTime.now() - startTime
    println("BenchmarkGetHttp: ms = ${Float64(perTime.toNanoseconds())/1000000.0}")
    return 0
}
