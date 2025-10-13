// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %disableConstPropagation %cmp_opt %chir2llvm %f -o %output 2>&1 | compare %f
// EXEC: %run %output

var g = true

main() : Int64 {
    var a = [0, 1, 2, 3, 4, 5]
    a[0] = 1
    if (g) {
        a = [2]
    } else {
        a = [3]
    }
    return a[0] - 2
}

// ASSERT: scan The field node in the line:102 and the column:37 was optimized by The opt: SROA
// ASSERT: scan The field node in the line:105 and the column:34 was optimized by The opt: SROA
// ASSERT: scan The field node in the line:105 and the column:47 was optimized by The opt: SROA

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
