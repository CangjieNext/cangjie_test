/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: Array_package02 import.conf
// EXEC: %compiler %cmp_opt %compile_lib_opt Array_package02/Array_package02.cj -o Array_package02.%middle
// EXEC: %compiler %cmp_opt %f Array_package02.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import Array_package02.*

main(): Int64 {
    if (a[0] != -1 || a1[0] != 1 || a2[0] != 1.0 || /* a3[0]!='a' || */ a4[0] != true /* || a5[0]!="aa" */ ) {
        return 1
    }
    return 0
}
