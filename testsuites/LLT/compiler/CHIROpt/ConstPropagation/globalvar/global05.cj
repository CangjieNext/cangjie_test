// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

var a = 1
var b = true
var c = foo()
var d = 2
var e = if (b) {
    d
} else {
    d - 2
}
var f = if (b) {
    let f1 = foo();
    d - 2
} else {
    let f2 = d;
    f2 - 1
}

func foo(): Int64 {
    a = 2
    b = false
    return a
}

main(): Int64 {
    if (e == 0 && f == 1) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex-not \[ConstPropagation\].*\[global05\.cj,