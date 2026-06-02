// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello cjc b CJC Hello c

internal import std.collection.*

type J = HashMap<String, Any>

func goo(): Int64 {
    print("Hello ")
    return 0
}

func foo(x: () -> Int64): Int64 {
    x()
}

main(): Int64 {
    var map2 = J([("b", goo), ("c", foo)])
    for ((k, v) in map2) {
        let castOP1 = v as () -> Int64
        match (castOP1) {
            case Some(x) => x()
            case _ =>
                print("CJC ")
                0
        }

        let castOP2 = v as (() -> Int64) -> Int64
        match (castOP2) {
            case Some(x) => x(goo)
            case _ =>
                print("cjc ")
                0
        }
        print("${k} ")
    }
    0
}
