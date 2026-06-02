// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC-PIPE-1: %compiler --lto=full -Oz %f 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan -Os and -Oz optimize options are not supported in LTO mode.

main() {
    return 0
}
