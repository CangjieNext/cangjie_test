// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let a: Int8 = 127 * 5
    print("${a}\n")
    if (a != 123) {
        return 1
    }
    let b: Int8 = -127 * 5
    print("${b}\n")
    if (b != -123) {
        return 2
    }
    let c: Int8 = 2 * 5
    print("${c}\n")
    if (c != 10) {
        return 3
    }
    return 0
}
