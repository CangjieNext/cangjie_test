// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=thin
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan Hello Cangjie.

main() {
    println("Hello Cangjie.")
}
