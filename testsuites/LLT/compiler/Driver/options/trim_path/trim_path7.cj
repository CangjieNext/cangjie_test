// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (Windows) DEPENDENCE: trim_path.py
// (Windows) EXEC: python trim_path.py trim_path7 exe
// (Windows) EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) ASSERT: regex [(][a-zA-Z]:\\[a-zA-Z0-9_\\]+\\trim_path7.cj:14[)]

main() {
    throw Exception("abc")
    0
}
