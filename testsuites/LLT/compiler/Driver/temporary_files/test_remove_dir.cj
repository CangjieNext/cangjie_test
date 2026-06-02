// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler -p . --output-type=staticlib -o %output
// EXEC: %ls | compare %f
// ASSERT: regex-not main-[a-zA-Z0-9]*

main() {
    return 0
}
