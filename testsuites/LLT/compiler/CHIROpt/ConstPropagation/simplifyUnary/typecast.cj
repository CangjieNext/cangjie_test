// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableConstPropagation %f -o %n.%suffix
// EXEC-PIPE-0: %run %output

@OverflowSaturating
main() {
    var a = 127_i8
    var b = 128_u8
    if (Int8(b) != a) {
        return 1
    }

    var b2 = 256_u16
    if (Int8(b2) != a) {
        return 1
    }

    var b3 = 65535_u16
    if (Int8(b3) != a) {
        return 1
    }
    0
}
