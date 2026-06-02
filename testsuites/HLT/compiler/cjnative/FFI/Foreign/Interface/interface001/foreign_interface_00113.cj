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
    func a(): Int8
    func a(): Int16
    func b(): Int8
    func b(): Int16
    static func c(): Int8
    static func c(): Int16
}

foreign interface B {
    func a(): Int8
    func a(): Int16
    func b(): Int8
    func b(): Int16
    static func c(): Int8
    static func c(): Int16
}
// ASSERT: scan sema_unexpected_wrapper
// ASSERT: scan sema_redefinition
