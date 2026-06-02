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


class A<T> {
    var a: T
    init(a: T) {
        this.a = a
    }
}

main(): Int64 {
    return A<VArray<Int64, $3>>([1, 2, 3]).a[0] - 1
}
// ASSERT: scan-2 HLIR ERROR: VArrays in instance class fields are not supported yet
