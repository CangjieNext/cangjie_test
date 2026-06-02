/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



let test : Int64 = 1

interface I1{
    let lambda = { i: Int64 => this.test - i}
}

main(): Int64 {
    return 1 // should compile failed
}
// ASSERT: scan parse_unexpected_declaration_in_scope
