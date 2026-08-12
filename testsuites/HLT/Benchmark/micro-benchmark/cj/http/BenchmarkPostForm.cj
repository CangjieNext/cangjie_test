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
import stdx.encoding.url.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

var server: Server = unsafe { zeroValue<Server>() }

// High-load data running core dump

let nums: Array<Int64> =[32, 256, 2048, 16384, 131072, 1048576]
let dataSize: Array<String> =["32", "256", "2K", "16K", "128K", "1M", "8M", "64M", "512M", "4G"]

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

func timeBenchmarkPostForm(num: Int64) {
    var reps = repsAll[num]
    var perTime = Float64((benchmarkPostForm(num)).toNanoseconds()) / Float64(reps)
    println("BenchmarkPostForm${dataSize[num]}_0: ${perTime.format(".2")} ns/op")
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
    for (i in 0..len) {
        timeBenchmarkPostForm(i)
    }
    return 0
}
