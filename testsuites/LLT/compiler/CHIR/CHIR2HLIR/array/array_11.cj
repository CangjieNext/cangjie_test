// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    var arr = Array<Int64>(3, {i => i})
    var cpy: Array<Int64> = arr.clone()
    cpy[0] = 2
    if (arr[0] == cpy[0] || cpy[2] != 2) {
        return 1
    }
    return 0
}
