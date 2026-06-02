// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %disableSemaVic %cmp_opt %n.cj

func foo(): Nothing {
    throw Exception()
}

main(): Int64 {
    var n: Nothing
    do {
        var a = 3;
        n = foo()
    } while (false)
    return n
}
