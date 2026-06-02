// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: vardecl4.cj
// EXEC: %compiler %cmp_opt %f vardecl4.cj -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

var AA = 20

main() {
    AA
    arrayTopInt64
    return 0
}
