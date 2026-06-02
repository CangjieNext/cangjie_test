/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var a: ArrayList<Rune> = ArrayList<Rune>([r'1', r'A', r'a'])
    a.add(r'D', at: 0)
    if (a.toString() != "[D, 1, A, a]") {
        return 1
    }
    return 0
}
