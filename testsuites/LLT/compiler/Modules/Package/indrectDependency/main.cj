// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_definition
// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_macro -p macro_definition
// (CJNATIVE) EXEC-PIPE-0: %compiler %compile_shared_lib_opt -p ./ -o %output -V 2>&1 | compare %f
// ASSERT: scan-not cangjie-std-ast
// ASSERT: scan cangjie-std-core

package macro_calling

import macro_calling.macro_definition.*

public let a: Int64 = @TestDef(1 + 2)

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    return 0
}
