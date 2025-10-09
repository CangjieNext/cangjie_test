// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import std.io.*
import stdx.net.http.*
func foo(a:HttpResponse){
    return a
}
struct A<T> {
    static var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
}

extend<T> A<T> {
    static func foo1() {
        return foo(A<HttpResponse>.a)
    }
}

main(): Int64 {
    0
}