// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src
// EXEC: cd ..
// EXEC: %compiler %import-cangjie-stdx %pkg_opt ./src/web %compile_lib_opt -o libweb.%middle
// EXEC: %compiler %import-cangjie-stdx %pkg_opt ./src libweb.%middle

internal import web.*
internal import stdx.net.http.*
internal import std.time.*
internal import std.io.*

main(): Int64 {
    print("webserver start ...\n")
    let cont = FooController()
    CJApp.addRouter("/foo", cont)
    CJApp.run()

    return 0
}
