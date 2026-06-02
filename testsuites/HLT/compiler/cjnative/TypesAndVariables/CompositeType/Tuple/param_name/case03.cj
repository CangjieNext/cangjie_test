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
    var a : (a: Int64, Int64, c: Int64) = (1, 1, 2)
    return a[1] + a[0] - a[2]
}
// ASSERT: scan parse_all_parameters_must_be_named
