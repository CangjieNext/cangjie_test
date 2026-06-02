// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
struct A<T> {
    var x: T
    init(x1: T) {
        x = x1
    }
}

main() {
    var x = 1
    var arr1: VArray<VArray<Rune, $2>, $3> = [[r'a', r'b'], [r'c', r'd'], [r'e', r'f']]
    var a = A<VArray<VArray<Rune, $2>, $3>>(arr1)
    if (a.x[0][0] != r'a') {
        return 1
    }
    if (a.x[x][0] != r'c' || a.x[1][0] != r'c') {
        return 1
    }
    0
}
