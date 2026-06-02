// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

enum E1 {
    | Case1(E2, E4)
    | Case2(S5)
    | None
}

enum E2 {
    | Case1(S3)
    | None
}

struct S3 {
    var x: E1 = E1.None
}

enum E4 {
    | Case1(E1, Int64)
    | Case2(S3)
    | None
}

struct S5 {
    var x: E6 = E6.None
}

enum E6 {
    | Case1(E7, S8)
    | None
}

enum E7 {
    | Case1(S3)
    | None
}

struct S8 {
    var x: E9 = E9.None
}

enum E9 {
    | Case1(E6)
    | None
}

main() {
    var e1 = E1.Case2(S5())
    0
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
