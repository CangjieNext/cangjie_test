// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan catch.
// ASSERT: scan success.

class A<T> <: Exception {}

func test<T>() {
    try {
        throw A<T>()
    } finally {}
}

main() {
    try {
        test<Int64>()
    } catch (_: Exception) {
        print("catch.\n")
    }
    print("success.\n")
    return 0
}
