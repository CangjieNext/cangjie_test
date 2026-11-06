// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: extend_member_alias_overlap
// EXEC: %compiler %cmp_opt extend_member_alias_overlap/first/a.cj extend_member_alias_overlap/second/a.cj extend_member_alias_overlap/third/a.cj --output-type=dylib -O2 -o libabi_demo.%dylib_suffix
// (Linux) EXEC: nm -D libabi_demo.%dylib_suffix | compare %f
// (Linux) ASSERT: scan-not _CN8abi_demoXlUa$K_6helperHv
// (Linux) ASSERT: scan _CN8abi_demoXlUa$K0_6helperHv
// (Linux) ASSERT: scan _CN8abi_demoXlUa$K2_6helperHv
// EXEC: %compiler %cmp_opt %f -O2 -L . -labi_demo -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import abi_demo.*
main() {
    if (1.first() != 12 || 1.second() != 23 || 1.third() != 33) {
        return 1
    }
    return 0
}
