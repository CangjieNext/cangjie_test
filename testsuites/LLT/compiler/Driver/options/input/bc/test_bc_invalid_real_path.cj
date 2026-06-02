// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows)EXEC: %compiler %f -o %main
// (not Windows)EXEC: ln -s %main hack.bc
// (not Windows)EXEC-PIPE-0: %compiler %f hack.bc 2>&1 | compare %f
// ASSERT: regex warning.*: Not a .bc file: 'hack.bc'

main() {
    return 0
}
