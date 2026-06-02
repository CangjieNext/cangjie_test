/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*
import std.random.*

main() {
    f()
    assert(Pair<Int64, Float64>.Red.first(1), 1)
    assert(Pair1<Int64, Random>.Red.first(1), 1)
    assert(Pair2<Random, Int64>.Red.second(1), 1)
    assert(S7<Random, Float64>.Red.getX(), 11)
    assert(C1().v1, 11)
    assert(C1().f1(), 11)
}
