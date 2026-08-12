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
import stdx.encoding.url.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

var server: Server = unsafe { zeroValue<Server>() }

// High-load data running core dump

let nums: Array<Int64> =[32, 256, 2048, 16384, 131072, 1048576]

let repsAll:Array<Int64> =[10239, 10000, 9146, 8498, 3326, 1416, 1704 , 1080, 1530, 1598]
let len: Int64 = nums.size

func getForm(len: Int64): String {
    var lens = nums[len]
    var array: Array<Rune> = Array<Rune>(lens, repeat: r'1')
    array[2] = r'='
    var string: String = String(array)
    var data = Form(string)
    return data.toEncodeString()
}

func benchmarkPostForm(num: Int64): Duration {
    spawn {
        serve()
    }
    sleep(Duration.second)
    let port = server.port
    let client = ClientBuilder().build()
    var form = getForm(num)
    var reps = repsAll[num]
    var startTime = DateTime.now()
    for (_ in 0..reps) {
        client.post("http://127.0.0.1:${port}/dd", form)
    }
    var endTime = DateTime.now()
    client.close()
    return endTime - startTime
}

func serve() {
    let socket = TcpServerSocket(bindAt: IPSocketAddress("0.0.0.0", 0))
    server = ServerBuilder().listener(socket).build()
    server.distributor.register("/dd", {
            ctx =>
            ctx.request.form
            ctx.responseBuilder.body(Array<UInt8>())
            return
        })
    server.logger.level = LogLevel.OFF
    server.serve()
}

main(): Int64 {
    var startTime = DateTime.now()
    for (i in 0..len) {
        benchmarkPostForm(i)
    }
    var perTime = Float64((DateTime.now() - startTime).toNanoseconds())
    println("BenchmarkPostFormHttp: ms = ${perTime/1000000.0}")
    return 0
}
