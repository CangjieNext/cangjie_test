// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %rmdir outdir
// EXEC: mkdir outdir
// EXEC: %compiler %f -o outdir
// EXEC-PIPE: %ls outdir | compare %f
// ASSERT: regex-auto main

main() {
    return 42
}
