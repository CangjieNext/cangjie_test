// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) DEPENDENCE: lto_test3_1.cj
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt lto_test3_1.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full liblto_test3.bc
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan 123
// (Linux and CJNATIVE) ASSERT: scan Hello Cangjie.

internal import lto_test3.*

main() {
    foo()
    println("Hello Cangjie.")
}
