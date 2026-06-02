/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler %cmp_opt %pkg_opt %compile_lib_opt src/pkga/ -o ./ 2>&1 | compare %f

import pkga.*

func run(): Int64 {
    let v0: Int64 = 1
    let x: pkga.Data = pkga.Data(v0, v0)
    let y: pkga.Data<Int64> = pkga.Data<Int64>(v0, v0)
    if (x != 0) {
        return 1
    }
    if (y != 0) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_redefinition
