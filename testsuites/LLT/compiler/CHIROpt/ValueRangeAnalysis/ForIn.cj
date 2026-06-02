// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f

var i: Int8 = 16
let WORD_BYTES_SIZE: Int8 = 8

main() {
    for (k in i - WORD_BYTES_SIZE..i) {
        println(k)
    }
}

// ASSERT: regex-not \[RangePropagation\].*\[13,\d+\]
