// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -O2 -o %n.%suffix
// EXEC-PIPE: %run %run_opt %n.%suffix

import std.collection.*

public class Test_ArrayList_Brackets {
    static var int_128 = ArrayList<Int64>(128, {index: Int64 => index})
    static var int = 1

    func BenchmarkArrayListBrackets_Int64_N128(): Unit {
        int = int_128[64]
    }
}

main() {
    Test_ArrayList_Brackets().BenchmarkArrayListBrackets_Int64_N128()
    0
}
