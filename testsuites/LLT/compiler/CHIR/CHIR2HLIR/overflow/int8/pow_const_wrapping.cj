// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let a = Int8(127 ** 2) // wrapping
    print("${a}\n")
    if (a != 1) {
        return 1
    }
    let b = Int8(-127 ** 3) // wrapping
    print("${b}\n")
    if (b != -127) {
        return 2
    }
    let c = Int8(2 ** 3)
    print("${c}\n")
    if (c != 8) {
        return 3
    }
    return 0
}
