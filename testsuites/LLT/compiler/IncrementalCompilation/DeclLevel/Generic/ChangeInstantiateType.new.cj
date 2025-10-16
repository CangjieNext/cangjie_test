internal import std.sort.* 

var a1 = [5, 1, 2, 3, 4]

func comp(data1: Int64, data2: Int64): Ordering { return Ordering.GT 
} 

main(): Int64 { 
    a1.sortBy(comparator: comp) 
    if(a1[0] == 4 && a1[1] == 3 && a1[2] == 2 && a1[3] == 1 && a1[4] == 5) { 
        return 0 
    } 
    return 1 
} 


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
