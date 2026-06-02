/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var GlobalVar: SomeType5 = SomeType5()

class SomeType5 {
    ~init() {
        GlobalVar = this
    }
}
// (not iOS) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_use_this_as_an_expression_in_func
