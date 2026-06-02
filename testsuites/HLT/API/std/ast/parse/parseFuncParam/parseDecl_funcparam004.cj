/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args 

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

main() {
    let tok = quote(private Test( 
        static var width!: Int64 = 1 // member variable parameter 
    ) {
    }
    )
    let decl = PrimaryCtorDecl(tok)
    decl.dump()

    0
}
