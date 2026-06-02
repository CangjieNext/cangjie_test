/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler  %cmp_opt %f -o %output
// ASSERT: scan parse_illegal_modifier_in_scope

interface I<T>{
    internal operator func -(): I<T> {
        I<T>()
    }
}

public var a = BB<Int64>(0)

main(){
    return a
}