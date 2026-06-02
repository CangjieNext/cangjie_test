/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output


import std.collection
main():Int64 {
    if ( case01() != 10 ) {
        return 1
    }
    if ( case02() != 3 ) {
        return 2
    }
    if ( case03() != 21 ) {
        return 3
    }
    return 0
}

func case01(){
    let intSet = HashSet<Int64>([0,1,2,3,4])
    var a: Int64 = 0
    for (item in intSet) {
        a = a + item
    }
    a
}

func case02(){
    let intSet1 = HashSet<Int64>([0,1,2])
    let intSet = HashSet<HashSet<Int64>>([intSet1, intSet1,intSet1])
   %x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x
// ASSERT: scan parse_nl_warning
// ASSERT: scan parse_expected_right_delimiter
