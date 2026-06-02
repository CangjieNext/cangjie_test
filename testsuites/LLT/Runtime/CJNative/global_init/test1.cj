// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: test2.cj, test3.cj
// EXEC: %compiler %f %int_overflow_opt=wrapping test2.cj test3.cj -o %output
// EXEC: %run %run_opt %output

main(): Int64 {
    return 0;
}
