// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let a = UInt64(9223372036854775807 ** 2) // wrapping
    print("${a}\n")
    if (a != 1) {
        return 1
    }
    let b = UInt64(2 ** 3) // wrapping
    print("${b}\n")
    if (b != 8) {
        return 2
    }
    return 0
}
