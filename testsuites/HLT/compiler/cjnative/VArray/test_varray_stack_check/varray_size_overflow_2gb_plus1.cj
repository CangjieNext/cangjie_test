/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The stacksize of default::main() exceeds cangjie max stacksize(2GB)

main(): Int64 {
    var varr: VArray<Int64, $268435457> = VArray<Int64, $268435457> {i => i + 1}
    if (varr.size == 268435457) {
        return varr[0] - 1
    }
    return 1
}
