/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

import pkgs.*

func a<T>(a: T) where T <: ch {
    return Rune(1).b()
}

main(): Int64 {
    if (a<ch>(r'y') == r'a') {
        return 0
    } else {
        return 1
    }
}
