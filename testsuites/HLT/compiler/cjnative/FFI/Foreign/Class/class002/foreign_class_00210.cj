/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign class A {
    func a(input: Int16): Int8
    func a(input: Int16): Int32
}

foreign class B {
    func a(input: Int16): Int8
    func a(input: Int16): Int32
}
// ASSERT: scan sema_unexpected_wrapper
// ASSERT: scan sema_redefinition
