// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    var tuple= (1,2)
    let v1 = Option<(Int64,Int64)>.Some(tuple)
    
    let range1 = 0..10:1
    let range2 = 2..5:1
    let v2 = Option<Range<Int64>>.Some(range1)

    let str1 = "abc"
    let v3 = Option<String>.Some(str1)
    let arr0 = [1, 2, 3, 4, 2]
    let v7 = Option<Array<Int64>>.Some(arr0)
    0
}
