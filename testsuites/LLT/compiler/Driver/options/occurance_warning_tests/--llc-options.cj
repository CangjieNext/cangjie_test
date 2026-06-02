// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: generate_result.py
// (DEBUG_OPTION)EXEC: %python generate_result.py colorize %n
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %n -I=. %n -I=. -o %output ./%f 2>&1 | compare ./%n.txt

main() {
    return 0
}
