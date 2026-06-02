/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 | compare %f

import pkgs

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data = Data(a, b)
    let data2: pkgs.Data = pkgs.Data(a, b)
    res = data.area()
    if (res == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_undeclared_identifier
