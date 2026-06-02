// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../pkgA
// EXEC: %compiler %compile_lib_opt -p pkgA
// EXEC-PIPE-1: %compiler %f %diag_json 2>&1 | compare %f

package pkgB

public import pkgA.*

public func foo() {
    return 3.0
}
// ASSERT: scan sema_missing_entry
