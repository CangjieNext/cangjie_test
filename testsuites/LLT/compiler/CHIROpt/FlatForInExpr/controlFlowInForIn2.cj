// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 -Woff all %f -o %n.%suffix
// RUN-EXEC-28: %run %n.%suffix

func foo(): Int64 {
    var sum = 0
    for (i in 0..20) {
        if (i > 7) {
            return sum
        }
        sum += i
    }
    return sum
}

main() {
    var x = foo()
    return x
}
