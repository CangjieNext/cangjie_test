// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableConstPropagation %cmp_opt %enableCompileDebug %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %output

var a = 1
var b = try {
    var b1 = foo();
    b1
} catch (_) {
    a
}
var c = if (true) {
    a = 3
    b
} else {
    a
}
var d = a
var e = 4
let f = if (true) {
    while (true) {
        var f1 = e;
        if (goo() > 1) {
            break
        }
    };
    e
} else {
    e
}

func foo(): Int64 {
    a = 2
    return a
}

func goo(): Int64 {
    e = 5
    return e
}

main(): Int64 {
    if (b == 2 && c == 2 && d == 3 && f == 5) {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex-not \[ConstPropagation\] The Load at \[global06\.cj,
