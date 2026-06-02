/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface MyInterface{
trait Num {
    func plus(a: This, b: This): This
}

append Int32 with Num {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}
}
// ASSERT: scan parse_expected_decl
