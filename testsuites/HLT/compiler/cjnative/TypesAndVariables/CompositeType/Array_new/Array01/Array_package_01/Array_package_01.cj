/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Array_package01 import.conf
// EXEC: %compiler %cmp_opt %compile_lib_opt Array_package01/Array_package01.cj -o Array_package01.%middle
// EXEC: %compiler %cmp_opt %f Array_package01.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import Array_package01.*

main(): Int64 {
    return return a.size + a1.size + a2.size + a3.size + a4.size + a5.size + a6.size + a7.size + a8.size + a9.size + a10
        .size + a11.size + a12.size + a13.size
}
