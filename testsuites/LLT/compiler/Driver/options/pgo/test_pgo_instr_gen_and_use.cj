// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE-1: %compiler --pgo-instr-gen --pgo-instr-use=test.profdata %f 2>&1 -o %output | compare %f
// (CJNATIVE and Linux) ASSERT: scan using both '--pgo-instr-gen' and '--pgo-instr-use' is not allowed

main() {
    return 0
}
