// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %enableCompileDebug %compile_lib_opt src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %enableCompileDebug pkgs.%middle %f %diag_json -o %output 2>&1 |compare %f

import pkgs.*

main(): Int64 {
    obj.foo()
    return 1
}
// ASSERT: scan sema_immutable_access_mutable_func
