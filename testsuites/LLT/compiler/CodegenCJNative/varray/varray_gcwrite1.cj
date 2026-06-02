// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto define internal i64 @_CN7default3fffEV5_lE(i8* %"$BP", [5 x i64]* noalias %x)
// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

func fff(x: VArray<Int64, $5>) {
    x[0]
}

class A {
    var varr1: VArray<Int64, $5> = [1, 2, 3, 4, 5]
}

main() {
    var a = A()
    fff(a.varr1) // ff(bp, avarray1)
    var varr1: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    fff(varr1)
    return 0
}
