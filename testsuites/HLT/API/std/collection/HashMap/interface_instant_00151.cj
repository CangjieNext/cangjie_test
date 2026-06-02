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

interface A<X> {}

interface A2 <: A<HashMap<Int32, Int64>> {}

class B<X> <: A<X> {}

class C <: A<HashMap<Int32, Int64>> {}

main() {
    var i: A<HashMap<Int32, Int64>> = B<HashMap<Int32, Int64>>()
    var j: A<HashMap<Int32, Int64>> = C()
    var k: A2
    return 0
}
