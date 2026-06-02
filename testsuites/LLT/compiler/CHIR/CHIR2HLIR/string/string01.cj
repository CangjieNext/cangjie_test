// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    var a: String = "hello cangjie"
    var b: String = "hello cj"
    var a2: String = "hello cangjie"
    var c = (a == b)
    if (c) {
        return 1
    }
    if (a == a2) {
        return 0
    }
    return 2
}
