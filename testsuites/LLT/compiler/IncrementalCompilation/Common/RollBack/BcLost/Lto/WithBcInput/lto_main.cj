// (Linux and CJNATIVE) DEPENDENCE: lto_lib.cj
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %incrementalCompile lto_lib.cj --lto=full --output-type=staticlib
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %incrementalCompile %f -o %output --lto=full liblto_lib.bc
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Linux and CJNATIVE) EXEC: %rmfile .cached/*.bc
// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %incrementalCompile %f -o %output --lto=full liblto_lib.bc
// (Linux and CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan 123
// (Linux and CJNATIVE) ASSERT: scan Hello Cangjie.

internal import lto_lib.*

main () {
    foo()
    println("Hello Cangjie.")
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
