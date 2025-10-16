// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: ../../../API/stdx/net/tls/files
// (Linux and CJNATIVE) DEPENDENCE: ../../../API/asan
// (Linux and CJNATIVE) DEPENDENCE: ../../../API/stdx/net/http/bodyReadUtil
// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt bodyReadUtil/read.cj -o read.%middle
// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f asan.%middle read.%middle -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan Server.get.1====Server.get.2\n200

internal import std.io.*
internal import stdx.net.http.*
internal import std.net.*
internal import std.fs.*
internal import stdx.net.tls.*
internal import stdx.net.tls.common.*
internal import stdx.crypto.x509.X509Certificate
internal import stdx.crypto.keys.*
internal import {asan.*, bodyReadUtil.*}

var port: UInt16 = 0
var ser = Option<Server>.None

main(): Int64 {
    serve()
    var cfg = TlsClientConfig()
    cfg.verifyMode = TrustAll
    let client = ClientBuilder().tlsConfig(cfg).build()
    var a = client.get("https://127.0.0.1:${port}/hello")
    let body = readAll(30, a)
    println(body)
    println(a.status)
    client.close()
    ser.getOrThrow().close()
    ser = None
    asanGC()
    return 0
}

func serve() {
    let pem0 = String.fromUtf8(readToEnd(File("./files/end_ecdsa.cer", Read)))
    let pem02 = String.fromUtf8(readToEnd(File("./files/end_ecdsa_private_key.pem", Read)))
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pem0).map({c => c}), GeneralPrivateKey.decodeFromPem(pem02))
    let server = ServerBuilder().addr("0.0.0.0").port(port).tlsConfig(cfg).build()
    server
        .distributor
        .register(
            "hello",
            {
                ctx =>
                ctx.responseBuilder.header("transfer-encoding", "chunked")
                let writer = HttpResponseWriter(ctx)
                let str1: String = "Server.get.1"
                writer.write(str1.toArray())
                let str2: String = "====Server.get.2"
                writer.write(str2.toArray())
            }
        )
    ser = Option<Server>.Some(server)
    spawn {
        server.serve()
    }
    sleep(Duration.millisecond * 100)
    port = server.port
}
