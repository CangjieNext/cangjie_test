/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:../utils.cj
// EXEC: %compiler %cmp_opt %f utils.cj %use_ast -o %output
// (not Windows) RUN-EXEC: %run %run_opt %output  %run_args
// (Windows) %run %run_opt %output %run_args 1>result.txt && dos2unix result.txt && cat result.txt 

import std.ast.*

main(){
    var i = """
    class A
    {
        init(){}
    }"""
    var a : Tokens = cangjieLex(i)
    var b : Tokens = quote(class A
    {
        init(){}
    })
    return check(a, b)
}


