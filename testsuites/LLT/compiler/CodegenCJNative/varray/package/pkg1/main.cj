// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: A.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt A.cj -o A.%middle
// EXEC: %compiler %cmp_opt A.%middle %f %enableO2 -o %output
// RUN-EXEC: %run %run_opt %output %run_args
internal import A.*

main() {
    println(varr1[0])
    println(C1().varr1[0])
    println(S1().varr1[0])
    if (varr1[0] != 1 || C1().varr1[0] != 11 || S1().varr1[0] != 21) {
        return 21
    }
    return 0
}
