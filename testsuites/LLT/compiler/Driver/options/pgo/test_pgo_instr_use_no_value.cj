// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE-1: %compiler %f --pgo-instr-use 2>&1 | compare %f
// (CJNATIVE and Linux) ASSERT: scan this Option needs a value: '--pgo-instr-use'

main() {
    return 0
}
