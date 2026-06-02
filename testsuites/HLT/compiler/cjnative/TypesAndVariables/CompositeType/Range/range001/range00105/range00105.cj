/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: range00105a import.conf
// EXEC: %compiler %cmp_opt %compile_lib_opt range00105a/range00105a.cj -o range00105a.%middle
// EXEC: %compiler %cmp_opt %f range00105a.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import range00105a.a

main(): Int64 {
    for (i in a) {
        print("a")
    }
    return 0
}
