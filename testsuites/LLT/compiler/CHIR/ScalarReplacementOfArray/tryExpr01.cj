// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %disableConstPropagation %cmp_opt %chir2llvm %f -o %output 2>&1 | compare %f
// EXEC: %run %output

func foo1() : Int64 {
    var a = [0, 1, 2, 3, 4, 5]
    try {
        a = [1]
    } catch (_) {
        a = [1]
    }
    return a[0] - 1
}

main() : Int64 {
    return foo1()
}

// ASSERT: scan-not was optimized by The opt: SROA

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
