/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC) ERRCHECK: %compiler %cmp_opt %f -o %output --pgo-instr-use
// (not MAC) ASSERT: scan this Option needs a value: '--pgo-instr-use'

main() {
    return 0
}
