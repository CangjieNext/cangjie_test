/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

interface update{
    operator func *(b:This):Int32
}

extend A <: update {
    public operator func *(b:A):Int32 
}

extend Rune <: update {
    public operator func  *(b:Rune):Int32 
}

main():Int64{
    var a : Rune = 'a'
    return 1
}
// ASSERT: scan parse_this_type_not_allow
// ASSERT: scan parse_missing_body
