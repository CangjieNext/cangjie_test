/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



main(): Int64 {
    var result = match (50) {
        case 60 => "pass"
        case 70 | 80 => "good"
        case other@ _ => other=40; "fail"   
    }                                       // Note: If match expression's cases type mismatch, other error messages will be shadowed. This will be fixed later when the implementation completely migrating from nullptr to INVALID_TY
    if (result == "50") {
        return 0
    }
    return 1
}
// ASSERT: scan parse_expected_double_arrow_in_case
