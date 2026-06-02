/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
const public = 1
const open = 1
const temp = 1
struct A{
    A(
        const a !: Array<Bool> = [public < open , open > temp]
    ){
    }
}

main(): Int64{
    var a = A()
    if (!a.a[0] && !a.a[1]){
        return 0
    }
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
