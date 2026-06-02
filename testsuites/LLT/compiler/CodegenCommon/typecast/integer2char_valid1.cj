// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

main() {
    var a = 0
    Rune(a)
    a = 1
    Rune(a)
    a = 0XD7FF - 1
    Rune(a)
    a = 0XD7FF
    Rune(a)
    a = 0xE000
    Rune(a)
    a = 0xE000 + 1
    Rune(a)
    a = 0x10FFFF - 1
    Rune(a)
    a = 0x10FFFF
    Rune(a)
    return 0
}
