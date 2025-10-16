// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import std.collection.*

// normal exception type and exception infomation test
func test(): Unit {
    throw IOException("Login success ,user is iva and ~!@#$%^&*()_+{pwd key123}|[]\\-=`:\"?><,./ is")
    throw NoneValueException("Login success ,user is iv and ~!@#$%^&*()_+{pwdkey123}|[]\\-=`:\"?><,./ is")
    throw ConcurrentModificationException()
    return
}

main() {
    return 0
}
