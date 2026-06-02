/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Array_define11 import.conf
// EXEC: %compiler %cmp_opt %compile_lib_opt Array_define11/Array_define11.cj -o Array_define11.%middle
// EXEC: %compiler %cmp_opt %f Array_define11.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import Array_define11.*

main(): Int64 {
    if (define11) {
        return define_11
    }

    return 1
}
