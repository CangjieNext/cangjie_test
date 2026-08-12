/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %import-cangjie-stdx %optimization_level_2 --no-sub-pkg %overflow_wrapping %f -o %output
// (只在测试机上可以执行） RUN-EXEC-PIPE: export cjHeapSize=16gb && export cjStackSize=64mb && export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run_stdx %run_opt %output %run_args

import std.io.*
import std.time.*
import std.convert.*
import stdx.net.http.*
import stdx.log.*
import stdx.logger.*
import std.console.Console

// java - 16384 illegal
var bodysizes =[0, 32, 256, 2048, 131072, 1048576]
let repsAll:Array<Int64> =[10000, 10000, 10000, 10000, 10000, 5000]
let buf = Array<Byte>(4096, repeat: 0)

func benchmarkPost(num: Int64): Duration {
    let client = ClientBuilder().build()
    var readStream = Array<Byte>(bodysizes[num], repeat: UInt8(UInt32(r'1')))
    var headers = HttpHeaders()
    headers.add("Content-Type", "application/octet-stream")
    headers.add("Content-Length", "${bodysizes[num]}")
    headers.add("Accept-Encoding", "gzip")
    var reps = repsAll[num]

    var startTime = DateTime.now()
    for (_ in 0..reps) {
        var requset = HttpRequestBuilder()
			.post()
			.url("http://127.0.0.1:60001/post")
            .body(readStream)
            .version(HTTP1_1)
            .addHeaders(headers)
			.build()
        client.send(requset)
    }
    var endTime = DateTime.now()
    client.close()
    return endTime - startTime
}

func timeBenchmarkPost(num: Int64) {
    var reps = repsAll[num]
    var perTime = Float64((benchmarkPost(num)).toNanoseconds()) / Float64(reps)
    println("BenchmarkHttpClientPost_N_${bodysizes[num]}: ${perTime.format(".2")} ns/op")
}

main(): Int64 {
    for (i in 0..6) {
        timeBenchmarkPost(i)
    }
    return 0
}