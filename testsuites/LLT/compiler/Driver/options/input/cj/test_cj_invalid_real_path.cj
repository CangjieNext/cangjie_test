// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -o %main
// EXEC: ln -s %main hack.cj
// EXEC-PIPE-0: %compiler %f hack.cj 2>&1 | compare %f
// ASSERT: regex warning.*: Not a .cj file: 'hack.cj'

main() {
    return 0
}
