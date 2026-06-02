// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f

var cond = mkcond()
var a = 1
var c = if (cond) {
    hoo();
    foo();
    3
} else {
    a
}
var d = c

func foo(): Int64 {
    a = 2
    return a
}

func hoo() {
    throw Exception("ttt")
}

func mkcond() {
    return false
}

main(): Int64 {
    0
}

// ASSERT: regex-not \[ConstPropagation\].*\[global07\.cj,