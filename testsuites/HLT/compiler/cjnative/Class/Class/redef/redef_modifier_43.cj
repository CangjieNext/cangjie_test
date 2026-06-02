/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main():Int64 {
    return 0
}

class Foo {
    public static func h() {}
}

extend Foo {
    public redef static func h() {} 
}
// ASSERT: scan parse_illegal_modifier_in_scope
