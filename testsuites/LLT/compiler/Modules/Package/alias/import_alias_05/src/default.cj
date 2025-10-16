// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json %f p1.%middle

internal import p1.testb as f
internal import p1.a as f

main(): Int64 {
    var res = f
    return res
}

// ASSERT: scan sema_ambiguous_use
