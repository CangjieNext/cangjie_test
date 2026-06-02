// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*
func test():Option<Int64>{
    var a : ?HashMap<Int64,Int64> = HashMap<Int64,Int64>([(1,1)])
    return Some(0)
}

main(): Int64 {
    return test() ?? 1
}