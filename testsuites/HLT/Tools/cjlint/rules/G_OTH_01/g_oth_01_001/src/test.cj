import std.console.*
import stdx.logger.*

let STR:String = "Login success ,user is and ~!@#$%^&*()_+{ppasswd}|[]\\-=`:\"?><,./ is"
let tmp = { => SimpleLogger(Console.stdOut).debug(STR) }

main() {
    tmp()
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
