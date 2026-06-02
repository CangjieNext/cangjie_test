// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package web

internal import stdx.net.http.*
internal import std.time.*
internal import std.fs.*

public open class Controller <: HttpRequestHandler {
    public func handle(ctx: HttpContext): Unit {
        match (ctx.request.method) {
            case "GET" => return get(ctx)
            case "PUT" => return put(ctx)
            case "POST" => return post(ctx)
            case "HEAD" => return head(ctx)
            case "PATCH" => return patch(ctx)
            case "TRACE" => return trace(ctx)
            case "DELETE" => return delete(ctx)
            case "CONNECT" => return connect(ctx)
            case "OPTIONS" => return options(ctx)
            case _ => ()
        }
    }

    public open func get(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func post(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func put(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func head(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func patch(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func trace(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func delete(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func connect(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }

    public open func options(ctx: HttpContext): Unit {
        let str: String = "Method Not Allowed"
        ctx.responseBuilder.body(str.toArray())
    }
}

public class FooController <: Controller {
    public override func get(ctx: HttpContext): Unit {
        let pathname: String = "../resource/webpages/login.html"
        ctx.responseBuilder.body(File.readFrom(pathname))
    }
}
