/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

abstract class A {
    private func a(): Unit
    protected func b(): Unit
    public func d(): Unit
    public func e(): Unit
}
// ASSERT: scan sema_invalid_member_visibility_in_class
