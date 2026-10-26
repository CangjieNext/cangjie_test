// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Reusing root-query results must preserve instance dispatch and static lookup.
// EXEC: %compiler %cmp_opt -O0 %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// EXEC: %compiler %cmp_opt -O2 %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

interface Root {
    func f(): Int64 { 0 }
    static func sf(): Int64 { 0 }
}

interface Middle <: Root {
    func f(): Int64 { 1 }
    static func sf(): Int64 { 1 }
}

interface Leaf <: Middle {
    func f(): Int64 { 2 }
    static func sf(): Int64 { 2 }
}

struct Impl <: Leaf {}

main(): Int64 {
    let value: Root = Impl()
    if (value.f() != 2 || Leaf.sf() != 2) {
        return 1
    }
    println("PASS")
    return 0
}

/* SCAN
PASS
*/
