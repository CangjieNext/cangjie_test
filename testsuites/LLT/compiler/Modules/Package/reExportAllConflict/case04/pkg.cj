// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg01 pkg02
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg01 -o pkg01.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg02 -o pkg02.%middle
// EXEC: %compiler %cmp_opt %f pkg02.%middle pkg01.%middle %diag_json -o %output 2>&1 | compare %f

public import pkg02.*

main() {
    return A
}

//ASSERT: scan sema_ambiguous_use
