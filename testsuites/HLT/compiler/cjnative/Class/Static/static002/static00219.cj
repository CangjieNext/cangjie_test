/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    static func a(): Unit
}

main() {
    return 1
}
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
// ASSERT: scan sema_missing_func_body
