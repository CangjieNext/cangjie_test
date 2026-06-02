// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %enableO2 %debugCHIROpt %cmp_opt %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1 << 1
}

func bar(a: UInt64, b: UInt64) {
    let mm = Array<Int64>(18) {
        i =>
        println(i);
        i * 2
    }
    if (a > b) {
        throw Exception()
    } else {
        if (a == b) {
            println("1")
        } else {
            println("2")
        }
    }
}

main() {
    bar(1, 2)
}

// ASSERT: regex-not The If Block at \[20,
// ASSERT: regex-not The If Block at \[26,
// ASSERT: regex-not core dumped
