/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %compile_lib_opt %f 2>&1 | compare %f

abstract class BaseA {
    public func getA(): Int32
    public func getB(): Int32
}

class BaseB <: BaseA {}
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
