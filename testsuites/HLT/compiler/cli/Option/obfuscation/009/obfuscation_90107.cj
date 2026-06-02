/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not O2 and not g) EXEC: %compiler %cmp_opt %obf_layout --obf-sym-prefix A %f -o %output
// (not O2 and not g) RUN-EXEC: %run %run_opt %output %run_args
// (not O2 and not g) EXEC: cat default.obf.map | compare %f
// (not O2 and not g) ASSERT: regex-not member_a
// (not O2 and not g) ASSERT: regex .*default.*cls.*<init>.*A.*
// (not O2 and not g and not iOS) ASSERT: regex .*default.*<main>.*A.*
// (not O2 and not g and iOS) ASSERT: regex .*default.*cj_main.*A.*

class cls {
    public var member_a: Int64 = 1
}

main() {
    print(cls().member_a)
    return 0
}
