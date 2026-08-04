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

// High-load data running core dump

let nums: Array<Int64> =[32, 256, 2048, 16384, 131072, 1048576]
let dataSize: Array<String> =["32", "256", "2K", "16K", "128K", "1M", "8M", "64M", "512M", "4G"]

let repsAll:Array<Int64> =[9474, 9418, 10000, 8637, 3262, 1442, 1741 , 1638, 1392, 1626]
let len: Int64 = nums.size

func benchmarkPut(num: Int64): Duration {
    spawn {
        serve()
    }
    sleep(Duration.millisecond * 500)
    let port = server.port
    let client = ClientBuilder().build()
    var readStream = Array<Byte>(nums[num], repeat: UInt8(UInt32(r'1')))
    var reps = repsAll[num]
    var startTime = DateTime.now()
    for (_ in 0..reps) {
        client.put("http://127.0.0.1:${port}/dd", readStream)
    }
    var endTime = DateTime.now()
    client.close()
    return endTime - startTime
}

func timeBenchmarkPut(num: Int64) {
    var reps = repsAll[num]
    var perTime = Float64((benchmarkPut(num)).toNanoseconds()) / Float64(reps)
    println("BenchmarkPut${dataSize[num]}_0: ${perTime.format(".2")} ns/op")
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
    for (i in 0..len) {
        timeBenchmarkPut(i)
    }
    return 0
}
