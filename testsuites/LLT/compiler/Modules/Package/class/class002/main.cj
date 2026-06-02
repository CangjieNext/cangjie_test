// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/pkg.cj -o pkg/pkg.%middle
// ERRCHECK: %compiler %cmp_opt pkg/pkg.%middle %diag_json %n.cj --import-path pkg -o %output

import pkg.*

main(): Int64 {
    var a = A<Int32>()
    return 1
}

// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
