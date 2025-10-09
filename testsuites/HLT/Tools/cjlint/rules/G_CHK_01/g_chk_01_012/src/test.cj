import std.io.*
import stdx.net.http.*

var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
class A<T> {

}
extend<T> A<T> {
    static func foo() {
        return a
    }
}

main(): Int64 {
    A<HttpResponse>.foo()
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
