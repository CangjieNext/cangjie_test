/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign interface A {
    func a(): Unit
    func a(): Unit
    func b(): Unit
    func b(): Unit
    static func c(): Unit
    static func c(): Unit
}

foreign interface B {
    func a(): Unit
    func a(): Unit
    func b(): Unit
    func b(): Unit
    static func c(): Unit
    static func c(): Unit
}
// ASSERT: scan sema_unexpected_wrapper
// ASSERT: scan sema_redefinition
