// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return 0;
}

var a: (Float32, Enum8) = (-19.0, Enum8.defaultValue);

enum Enum8 {
    defaultValue
    | enumValue183((Float32, Enum8))
}

// nested tuple type
struct b {
    let a = (2, e.c)
}

enum e {
    c | d(b)
}
