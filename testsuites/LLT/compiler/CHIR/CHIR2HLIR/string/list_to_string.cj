// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan pass

main() {
    // Array
    var arr3 = Array<Int64>()
    if (arr3.toString() != "[]") {
        return 3
    }
    var arr4 = Array<Int64>(1, {i => 1})
    if (arr4.toString() != "[1]") {
        return 4
    }
    print("pass")
    return 0
}
