// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

var x = (1, 2)
var y = x[0]

var (a, b) = (x[1], y)

main() {
    0
}

// ASSERT: regex-not \[ConstPropagation\].*\[tuple01\.cj,