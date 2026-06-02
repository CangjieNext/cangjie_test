/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan parse_conflict_modifier

protected struct A_a{
    private var a = 0
    static let degree: Int64
    internal static init(){
        degree = 180
    }
}

private var test = A_a().a

main(){
    var res = A_a.degree - 180
    return res
}