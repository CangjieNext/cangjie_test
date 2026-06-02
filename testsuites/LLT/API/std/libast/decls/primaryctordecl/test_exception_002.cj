// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan unexpected modifier 'static' on variable declaration in primary constructor

import std.ast.*

class Test {
    private Test(internal var width!: Int64 = 1 // member variable parameter 
        ) {
    }
}

main() {
    let tok = quote(private Test(
        static internal var width!: Int64 = 1 // member variable parameter
    ) {
    }
    )
    let decl = PrimaryCtorDecl(tok)
    decl.dump()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
