// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a = 5
var b = r'w'

class c {
    public init(d: Unit, e: Rune) {}
    public init(f: (Bool, Float32), g: Float32) {
        c((a--), b)
    }
}

main() {
    c((false, 1.0), 1.0)
    return 0
}
