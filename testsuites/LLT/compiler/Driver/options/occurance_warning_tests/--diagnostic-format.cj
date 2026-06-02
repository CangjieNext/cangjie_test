// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// %cmp_opt may contain `--diagnostic-format` option. To prevent unexpected behavior caused by
// options in %cmp_opt, we don't use %cmp_opt here.

// DEPENDENCE: generate_result.py
// EXEC: %python generate_result.py colorize %n
// EXEC-PIPE-0: %compiler %n noColor %n noColor -o %output ./%f 2>&1 | compare ./%n.txt

main() {
    return 0
}
