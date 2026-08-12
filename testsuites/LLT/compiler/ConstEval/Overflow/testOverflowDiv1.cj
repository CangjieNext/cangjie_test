// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %compile_exe_opt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan-not error: an exception was thrown while evaluating constant

@OverflowWrapping
const func divOverflowInTry(): Int8 {
    try {
        -128 / -1
    } catch (_: Exception) {
        0
    }
}

const X = divOverflowInTry()

main() {
    println(X.toString())
    0
}