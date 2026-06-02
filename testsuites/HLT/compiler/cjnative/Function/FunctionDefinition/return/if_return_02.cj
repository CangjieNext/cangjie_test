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
    foo01()
    return 0
}

// 函数返回最后一个表达式，if无else的表达式，Unit；但是return返回1，编译报错
func foo01() {
    if (true) {
        return 1
    }
}

// 函数返回最后一个表达式，if无else的表达式，Unit；但是要求函数返回类型是int32，编译报错
func foo02(): Int32 {
    if (true) {
        return Int32(1)
    }
}

// 函数返回最后一个表达式是a；if无else的表达式，Unit，a是unit类型；但是要求函数返回类型是int32，编译报错
func foo03(): Int32 {
    var a = if (true) {
        return Int32(1)
    }
    a
}
// ASSERT: scan sema_incompatible_func_body_and_return_type
// ASSERT: scan sema_mismatched_types
