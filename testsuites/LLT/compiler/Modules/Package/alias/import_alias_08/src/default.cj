// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f p1.%middle 2>&1 | compare %f

public import p1.a
public import p1.b as a

var a = 10

main(): Int64 {
    0
}

// ASSERT: scan package_shadowed_import
