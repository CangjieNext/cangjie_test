// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) EXEC: %compiler %f -o %main
// (not CJNATIVE) EXEC: ln -s %main hack.pdba
// (not CJNATIVE) EXEC-PIPE-0: %compiler %f hack.pdba 2>&1 | compare %f
// (not CJNATIVE) ASSERT: regex warning.*: Not a .pdba file: 'hack.pdba'

main() {
    return 0
}
