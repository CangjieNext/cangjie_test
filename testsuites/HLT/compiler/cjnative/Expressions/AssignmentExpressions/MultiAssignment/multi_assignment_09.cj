/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


main(){
    var a : Int64
    var b : Array<Int64>
    (_, b) = (_, [2])
    return b - a - a
}
// ASSERT: scan parse_unexpected_expected_found
