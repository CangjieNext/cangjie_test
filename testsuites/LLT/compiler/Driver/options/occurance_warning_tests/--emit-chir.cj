// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: generate_result.py
// EXEC: %python generate_result.py colorize %n
// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %n=raw %n=opt -o %output ./%f %n 2>&1 | compare ./%n.txt

main() {
    return 0
}
