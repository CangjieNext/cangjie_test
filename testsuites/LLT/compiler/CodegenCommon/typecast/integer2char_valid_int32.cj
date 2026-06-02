// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

internal import std.math.*

main() {
    var a1: Int32 = 0
    Rune(a1)
    var a2: Int32 = 0XD7FF
    Rune(a2)
    var a3: Int32 = 0xE000
    Rune(a3)
    var a4: Int32 = 0x10FFFF
    Rune(a4)
    return 0
}
