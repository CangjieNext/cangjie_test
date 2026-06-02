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
// EXEC: %compiler %cmp_opt %f array_new09.%middle  -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import array_new09.*

main(): Int64 {
    if (a.size == 1 && a[0] == 1 && a1.size == 1 && a1[0] == 1 && a2.size == 1 && a2[0] == 1 && a3.size == 1 && a3[0] ==
        1 && a4.size == 1 && a4[0] == 1 && a5.size == 1 && a5[0] == 1 && a6.size == 1 && a6[0] == 1 && a7.size == 1 &&
        a7[0] == 1 && a8.size == 1 && a8[0] == 1.0 && a9.size == 1 && a9[0] == 1.0 && a10.size == 1 && a10[0] == 1.0 &&
        a11.size == 1 && a11[0] == r'a' && a12.size == 1 && a12[0] == true && a13.size == 1 && a13[0] == "false") {
        return 0;
    }
    return 2
}
