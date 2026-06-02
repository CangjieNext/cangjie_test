// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: trim_path.py 
// (Unix and CJNATIVE) EXEC: python3 trim_path.py trim_path5 out llvm
// (Windows) EXEC: python trim_path.py trim_path5 exe llvm
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (Unix) ASSERT: regex [(][/](.+)/trim_path5.cj:16[)]
// (Windows) ASSERT: regex [(][a-zA-Z]:\\[a-zA-Z0-9_\\]+\\trim_path5.cj:16[)]

main() {
    throw Exception("abc")
    0
}
