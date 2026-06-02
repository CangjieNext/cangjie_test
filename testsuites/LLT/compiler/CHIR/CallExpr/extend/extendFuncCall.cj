// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Int64 = 1
    a == r'a'
    return 0
}

extend Int64 {
    public operator func ==(right: Rune): Bool {
        return true
    }
}
