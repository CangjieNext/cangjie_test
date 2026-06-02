// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %main
// EXEC: ln -s %main hack.a
// EXEC-PIPE-0: %compiler %f hack.a 2>&1 | compare %f
// ASSERT: regex warning.*: Not a .a file: 'hack.a'

main() {
    return 0
}
