/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  pkgb
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgb/*.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgb.Boo2

main(): Int64 {
    if (foo<Boo2>() != 2) {
        return 4
    }
    return 0
}

func foo<T>() where T <: Boo2 {
    return T.b2
}
