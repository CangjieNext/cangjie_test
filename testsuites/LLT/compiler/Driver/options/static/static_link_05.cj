// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt --target=aarch64-linux-ohos  --static 2>&1 | compare %f
// ASSERT: scan '--static' option is not supported

main() {
    try {
        throw Exception()
    } catch (e: Exception) {
        println("success")
    }
}