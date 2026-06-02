/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: array_new09 import.conf
// EXEC: %compiler %cmp_opt %compile_lib_opt array_new09/array_new09.cj -o array_new09.%middle
// EXEC: %compiler %cmp_opt %f array_new09.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import array_new09.*

main(): Int64 {
    return return a.size + a1.size + a2.size + a3.size + a4.size + a5.size + a6.size + a7.size + a8.size + a9.size + a10
        .size + a11.size + a12.size + a13.size
}
