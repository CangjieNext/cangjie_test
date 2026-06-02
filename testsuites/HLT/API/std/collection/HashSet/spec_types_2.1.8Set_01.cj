/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

class A {}

class B {}

main() {
    let setZero: HashSet<Int32> = HashSet<Int32>() // empty Set
    let setOne: HashSet<Int32> = HashSet<Int32>([5, 6, 7, 5]) // setOne = #{5,6,7}, as duplicated element '5' is removed
    var setTwo = HashSet<Float64>([1.1, 2.1, 3.1, 4.1]) // The type of setTwo is inferred to be Set<Float64>.
    return 0
}
