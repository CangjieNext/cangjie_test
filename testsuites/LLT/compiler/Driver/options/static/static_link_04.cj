// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt --int-overflow=wrapping --static %f --output-type=staticlib -o %output 2>&1 | compare %f
// ASSERT: scan '--static' option is only effective when compiling executables.

main() {
    try {
        throw Exception()
    } catch (e: Exception) {
        println("success")
    }
}