// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Linux) EXEC-PIPE-1: %compiler --pgo-instr-use=notExist.profdata %f 2>&1 | compare %f
// (CJNATIVE and Linux) ASSERT: scan No such file or directory: 'notExist.profdata'.

main() {
    return 0
}
