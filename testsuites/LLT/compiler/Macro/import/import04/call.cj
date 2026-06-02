// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt_chir2hlir  %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main(): Int64 {
    let tokens = quote(
        import A
        import A.B.C.D
        import A.B.C.{E, F, G, H}
        import A.B.C.{E, F.I, G.O, H}
    )
    let p = parseProgram(tokens)
    let importList = p.importLists
    if (importList.size != 4) {
        return 1
    }
    if (!importList[0].toTokens().toString().contains("import A")) {
        return 2
    }
    if (!importList[1].toTokens().toString().contains("import A.B.C.D")) {
        return 3
    }
    if (!importList[2].toTokens().toString().contains("import A.B.C.{ E, F, G, H }")) {
        return 4
    }
    if (!importList[3].toTokens().toString().contains("import A.B.C.{ E, F.I, G.O, H }")) {
        return 5
    }
    return 0
}
