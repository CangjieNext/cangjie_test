// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class CA<T> {}

main(): Int64 {
    var k0 = {x: Int32 => Int64(1)}
    var k1 = CA<(Int32) -> Int64>()
    var k2 = CA<CFunc<(Int32) -> Int64>>()
    var k3 = CA<CA<((Int32) -> Int16) -> (Int64) -> Bool>>()
    return 0
}
