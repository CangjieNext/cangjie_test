// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableO2 %f -o %output
// RUN-EXEC-PIPE-0: %run %output

main() {
    const cMatch1 = match (2) {
        case 1 | 3 => 1
        case _ => 2
    }
    const tup = (1, "2", cMatch1)
    const cMatch2 = match (tup) {
        case (x, "1", y) => 1
        case (1, "2", y) where false => 2
        case (x, y, z) => 3
    }
    return cMatch2 - 3
}
