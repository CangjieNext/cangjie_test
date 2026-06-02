/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output





import stdx.net.http
import stdx.net.tls.*
import std.io
import std.net
var port: UInt16 = 0
main(): Int64 {
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
        let resp = "Hello".toArray()
        rws.write(resp)
        return
    })
    let server = Server(hd)
    let socket = SocketServer(SocketNet.TCP, "0.0.0.0", port)
    port = socket.port
    spawn {
        server.serve(std import io
import std.net
var port: UInt16 = 0
main(): Int64 {
    let hd = Route()
    hd.handle("/dd", { rws: ResponseWriteStream, req: Request =>
       socket)
    }
    let b = abc()
    server.registerOnShutdown({ b.a = 100;print("===============")})
    server.close()
    if( b.a != 100 ){
        return 1
    }
    return 0
}
class abc{
    var a = 10
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_double_arrow_in_lambda
