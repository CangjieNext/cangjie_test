/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 | compare %f

import pkgs.opt

func run(): Int64 {
    var res: String = match (opt) {
        case Some(x) => x
        case None => ""
    }
    if (res == "option") {
        return 0
    }
    return 1
}

main(): Int64 {
    run()
}
// ASSERT: scan package_decl_not_find_in_package
