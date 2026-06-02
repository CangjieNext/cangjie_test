// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f

open class A {}

class B <: A {}

main() {
    var a: Array<A> = Array<B>()
    0
}
// ASSERT: scan sema_mismatched_types
