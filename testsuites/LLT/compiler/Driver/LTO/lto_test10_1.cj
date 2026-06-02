// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC-PIPE-1: %compiler --compile-as-exe %f 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: regex error.* --compile-as-exe only takes effect when lto mode is enabled
// (Linux and CJNATIVE) EXEC: %compiler --compile-as-exe  --lto=full %f
main() {
    return 0
}