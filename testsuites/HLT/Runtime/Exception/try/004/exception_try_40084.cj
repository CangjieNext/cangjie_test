/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A <: Exception {}

main() {
    match ("1") {
        case "${try { throw A(); 1 } finally {};1}" => 0
        case _ => 0
    }
}
// ASSERT: scan sema_interpolation_in_const_pattern
