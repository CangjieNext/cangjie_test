// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
func fff(x: VArray<Int64, $5>) {
    x[0]
}

class A {
    var varr1: VArray<VArray<Int64, $5>, $2> = [[1, 2, 3, 44, 5], [2, 3, 4, 54, 6]]
}

main(): Int64 {
    var a = A()
    if (fff(a.varr1[0]) != 1) {
        return 1
    }
    return 0
}
