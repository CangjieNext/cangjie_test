// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %cmp_opt %f --dy-std --dy-libs -o %output
//  RUN-EXEC-3: %run %run_opt %output %run_args
// (CJNATIVE and Linux) EXEC-PIPE-0: %ldd %output 2>&1 | compare %f
// (CJNATIVE and Linux) ASSERT: scan cangjie-std-unicode.so
// (CJNATIVE and Windows) ASSERT: scan cangjie-std-unicode.dll

internal import std.unicode.*

main() {
    let s = "　"
    if (s.isBlank()) {
        3
    } else {
        0
    }
}
