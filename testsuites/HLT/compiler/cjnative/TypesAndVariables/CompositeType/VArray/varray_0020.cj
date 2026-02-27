/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// (CJNATIVE and not iOS) ASSERT: scan LLVM ERROR: The stacksize of default::main() exceeds cangjie max stacksize(2GB).
// (CJNATIVE and iOS) ASSERT: scan LLVM ERROR: The stacksize of default::cj_main() exceeds cangjie max stacksize(2GB).

main(): Int64 {
    var varr: VArray<Int64, $9223372036854775807> = VArray<Int64, $9223372036854775807> {i => i + 1}
    if (varr.size == 9223372036854775807) {
        return varr[0] - 1
    }
    return 1
}
// (not CJNATIVE) ASSERT: scan-2 sema_exceed_num_value_range
