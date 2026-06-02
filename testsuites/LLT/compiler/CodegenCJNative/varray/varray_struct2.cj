// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

struct A {
    var c = 1
    var d: Int8 = 5
    init(c1: Int64) {
        c = c1
        d = Int8(c) + Int8(12)
    }
}

main() {
    var x = 1
    var arr1: VArray<VArray<A, $2>, $3> = [[A(1), A(2)], [A(3), A(4)], [A(5), A(6)]]
    var z = arr1[0][0]
    z.c = 88
    if (arr1[0][0].c != 1) {
        return 1
    }
    if (arr1[x][0].c != 3 || arr1[1][0].d != 15) {
        return 1
    }
    0
}
