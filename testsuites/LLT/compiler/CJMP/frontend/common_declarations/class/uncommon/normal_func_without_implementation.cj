// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: a uncommon function of a common class whitout implementation is error
// case: common function without implementation must have return type
// EXEC-PIPE-1: %compiler %diag_json --experimental %f --output-type=chir 2>&1 | compare %f
// ASSERT: scan sema_missing_func_body

package cmp
common class C{
    func foo():Unit
}
