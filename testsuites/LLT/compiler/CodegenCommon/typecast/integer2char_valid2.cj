// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

main() {
    var a1: Int8 = 119
    if (Rune(a1) != r'w') {
        return 1
    }
    var a2: Int16 = 119
    if (Rune(a2) != r'w') {
        return 2
    }
    var a3: Int32 = 119
    if (Rune(a3) != r'w') {
        return 3
    }
    var a4: Int64 = 119
    if (Rune(a4) != r'w') {
        return 4
    }
    var a5: UInt8 = 119
    if (Rune(a5) != r'w') {
        return 5
    }
    var a6: UInt16 = 119
    if (Rune(a6) != r'w') {
        return 6
    }
    var a7: UInt32 = 119
    if (Rune(a7) != r'w') {
        return 7
    }
    var a8: UInt64 = 119
    if (Rune(a8) != r'w') {
        return 8
    }
    var a9: IntNative = 119
    if (Rune(a9) != r'w') {
        return 9
    }
    var a10: UIntNative = 119
    if (Rune(a10) != r'w') {
        return 10
    }
    return 0
}
