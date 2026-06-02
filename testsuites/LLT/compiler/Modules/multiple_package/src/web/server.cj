// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package web

internal import stdx.net.http.*
internal import std.time.*
internal import std.net.*

public class HttpServer {
    private var server: Server

    public init() {
        this.server = ServerBuilder().addr("0.0.0.0").port(0).build()
    }

    public func run() {
        spawn {
            server.serve()
        }
    }

    public func addRouter(rootPath: String, c: Controller) {
        server.distributor.register(rootPath, c)
    }
}

public var CJApp = HttpServer()
