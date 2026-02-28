/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// (not Windows) RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.env.*
import std.runtime.*
import std.posix.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

let signal: Int32 = 1
var server = ServerBuilder().addr("127.0.0.1").port(0).build()

func sendSignal(sig: Int32): Unit {
    kill(Int32(getProcessId()), sig)
    sleep(Duration.second)
}

func func_1(_: Int32) {
    func startserve(): Unit {
        // 不设置content-length
        var a: HttpRequestHandler = FuncHandler({
            httpContext => httpContext.responseBuilder.body(Array<UInt8>(1000, repeat: UInt8(10)))
        })
        server.distributor.register("/test/a", a)
        server.serve()
    }
    spawn {
        startserve()
    }

    while (server.port == 0) {
        sleep(Duration.millisecond)
    }
    return false
}

func func_2(_: Int32) {
    let port = server.port
    var req1 = HttpRequestBuilder().url("http://127.0.0.1:${port}/test/a").build()
    var client = ClientBuilder().build()
    var response1 = client.send(req1)
    @Expect(response1.status, UInt16(200))
    var buf1 = Array<UInt8>(10000, repeat: 0)
    var readlen1 = response1.body.read(buf1)
    @Expect(buf1[0..readlen1], Array<UInt8>(1000, repeat: 10))
    client.close()
    server.close()
    return true
}

// 验证注册函数的内容
main() {
    resetSignalHandler()
    registerSignalHandler(Signal(signal, "${signal}"), func_1)
    registerSignalHandler(Signal(signal, "${signal}"), func_2)
    sendSignal(signal)
    resetSignalHandler()
    return 0
}
