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
enum A {
    a(Int32)
}

main(): Int64 {
    var l: A = A.a(1)
    var r: A = A.a(2)
    var temp = r
    l = temp
    var res: Int32 = match (l) {
        case a(x) => x
    }
    if (res == 2) {
        return 0
    }
    return 1
}
