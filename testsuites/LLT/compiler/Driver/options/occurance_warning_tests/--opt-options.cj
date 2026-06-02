// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: generate_result.py
// (DEBUG_OPTION)EXEC: %python generate_result.py colorize %n
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0: %compiler %cmp_opt %n -denormal-fp-math=ieee %n -denormal-fp-math=ieee -o %output ./%f 2>&1 | compare ./%n.txt

main() {
    return 0
}
