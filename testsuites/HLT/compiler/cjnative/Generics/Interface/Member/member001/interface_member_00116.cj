/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<T> {
    func t<T>(a: T): T
}

class A <: I<Int32> {
    // func t<Int32>(a:Int32):Int32{a}
}

main() {
    A()
    return 0
}

// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
