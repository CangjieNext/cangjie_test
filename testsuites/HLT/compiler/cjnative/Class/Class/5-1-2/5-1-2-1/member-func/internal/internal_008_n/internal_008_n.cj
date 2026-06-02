/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1.cj
// EXEC-PIPE-1: %compiler %cmp_opt pkg1.cj %f -o %output 2>&1 | compare %f

package pkg1

class Data <: Base {
    public func get(): Int32 {
        return 1
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.get() != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
// ASSERT: scan sema_missing_func_body
// ASSERT: scan sema_non_inheritable_super_class
