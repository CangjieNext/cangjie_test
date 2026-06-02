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

struct Ab<T> {
    var a: T
    init(a: T) {
        this.a = a
    }
}

main(): Int64 {
    var varr: VArray<Ab<Int64>, $2> = [Ab<Int64>(1), Ab<Int64>(1)]
    varr[0] = Ab<Int64>(-1)
    return varr[0].a + varr[1].a
}
