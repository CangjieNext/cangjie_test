/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func foo_tuple(): Int64 {
    //  var res1 = true ? (3.14, 'P') : (3, 'P')
    //  var res2 = false ? (3.14, 'P') : (2.3, 'P')
    var res1 = (3.14, 'P')
    var res2 = (2.3, 'P')
    if (res1[0] == 3.14 && res2[0] == 2.3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return foo_tuple()
}
