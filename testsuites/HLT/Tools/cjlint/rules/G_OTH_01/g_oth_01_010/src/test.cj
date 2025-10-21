/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.console.*
import stdx.logger.*

struct S<T> {
    static let STR:String = "Login success ,user is and ~!@#$%^&*()_+{key}|[]\\-=`:\"?><,./ is"
}

main() {
    let STR = S<String>.STR
    let tmp = { => SimpleLogger(Console.stdOut).debug(STR) }
    tmp()
    return 0
}
