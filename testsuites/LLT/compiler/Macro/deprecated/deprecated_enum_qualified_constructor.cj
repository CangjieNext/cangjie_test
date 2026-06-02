// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan enum 'En' is deprecated.
// ASSERT: scan enum 'En2' constructor 'A2' is deprecated.
// ASSERT: scan enum 'En2' is deprecated.

@Deprecated
enum En {
    | A
    | B(Bool)
}

@Deprecated
enum En2 {
    @Deprecated
    A2
}

main(): Unit {
    let _ = A
    let _: En = En.A // do not report for `A`
    let _ = En.B(true) // do not report for `B`

    let _ = En2.A2
}

