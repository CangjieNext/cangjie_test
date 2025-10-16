// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.posix.*
internal import std.regex.*
internal import std.io.*
internal import stdx.net.http.*

class A{
    func foo(){
        var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
        var regex: String = "abc" +  a.toString()
        var logMatcher:  Regex = Regex(regex)
        return 0
    }
}

main(): Int64 {
    return 0
}