/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let tok = quote(
        foreign func rand(): Int64
        main() {
            let ptr = CPointer<Byte>(rand)     
            let f = CFunc<() -> Int64>(ptr)  
            0     
        }
    )
    let prog = parseProgram(tok)

    prog.decls
    prog.importLists
    prog.packageHeader
    prog.dump()
    prog.toTokens()

    0
}
