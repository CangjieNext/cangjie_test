// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Every direct child of the sealed root is covered, so the wildcard is unreachable.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %diag_json %typecheck %f 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "sema_unreachable_pattern"

public open class A {}

abstract sealed class C <: A {}

public class C1 <: C {}

public class C2 <: C {}

public class C3 <: C {}

func f1(obj: C) {
    match (obj) {
        case v1: C1 => 0
        case v2: C2 => 1
        case v3: C3 => 2
        case _ => 3
    }
}
