internal import p1.*
internal import std.collection.* 
 
var a1 : ArrayList<Int64> = ArrayList([5, 1, 2, 3, 4])


main(): Int64 { 
    a1.sortBy(comparator: comp)
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
