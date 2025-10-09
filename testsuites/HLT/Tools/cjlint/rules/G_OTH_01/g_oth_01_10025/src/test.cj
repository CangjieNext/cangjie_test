macro package test

import std.ast.*
import std.console.*
import stdx.logger.SimpleLogger

public macro M1(input: Tokens): Tokens {
    var str:String = "Login success ,user is and ~!@#$%^&*()_+{ppasswd123}|[]\\-=`:\"?><,./ is"
    if(str == "passwd"){
        SimpleLogger(Console.stdOut).info(str)
    }
    input
}

main() {
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
