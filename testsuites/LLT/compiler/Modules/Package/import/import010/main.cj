// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1
// EXEC: %compiler %cmp_opt %compile_lib_opt M1/A.cj -o M1/A.%middle
// EXEC: %compiler %cmp_opt  M1/A.%middle %diag_json %f -o %n.%suffix 2>&1 | compare %f

internal import M1.pkg1.B

main(): Int64 {
    return 0
}

// ASSERT: scan package_search_error
