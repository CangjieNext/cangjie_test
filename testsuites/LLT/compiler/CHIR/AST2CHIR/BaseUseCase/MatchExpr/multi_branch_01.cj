// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output %enableO2
// EXEC: %run %run_opt %output

enum RGBColor {
    | Red(Int32) | Green(Rune, Int64) | Blue(Int64) | Pink
}

func f1(rType: RGBColor): Int32 {
    return match (rType) {
        case Red(_) => 1
        case Green(r'a', 1) => 3
        case Green(r'b', 1) => 4
        case Green(_, 2) => 5
        case Pink => 6
        case _ => 8
    }
}

main() {
    if (f1(Green(r'a', 1)) != 3) {
        return 1
    }
    if (f1(Green(r'a', 2)) != 5) {
        return 2
    }
    return 0
}
