// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Linux and CJNATIVE) EXEC-PIPE-1: %compiler --lto=full %f 2>&1 | compare %f
// (Windows and CJNATIVE) ASSERT: scan Windows does not support LTO.
// (Darwin and CJNATIVE) ASSERT: scan Darwin does not support LTO.
main() {
    return 0
}