// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) EXEC: %rmdir outdir
// (not CJNATIVE) EXEC: mkdir outdir
// (not CJNATIVE) EXEC: %compiler --output-type=cbc %f -o outdir
// (not CJNATIVE) EXEC-PIPE: ls outdir | compare %f
// (not CJNATIVE) ASSERT: regex-auto main

main() {
    return 42
}
