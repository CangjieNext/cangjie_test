// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt --int-overflow=wrapping --static --dy-std %f -o %output 2>&1 | compare %f
// ASSERT: scan flags --static and --dy-std are mutually exclusive and cannot be used together

main() {
    try {
        throw Exception()
    } catch (e: Exception) {
        println("success")
    }
}