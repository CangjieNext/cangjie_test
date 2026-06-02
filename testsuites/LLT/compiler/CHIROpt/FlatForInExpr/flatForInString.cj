// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 -Woff all %f -o %n.%suffix 2>&1
// RUN-EXEC-1: %run %n.%suffix

func testForInString(s: String): Int64 {
    var mask = 0
    for (i in s) {
        if (i >= b'@' && i <= 127) {
            mask |= (1 << (Int64(i) - 64))
        }
    }
    return mask
}

main() {
    var t = testForInString("&%#@*")
    return t
}
