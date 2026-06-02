// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan strictness of @Deprecated can not be weaken on inheritors
// ASSERT: scan class 'A' is deprecated.

@Deprecated[strict: true]
open class A {}

@Deprecated
class B <: A {
    B() {}
}

main(): Unit {}

