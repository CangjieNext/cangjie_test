// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f --apc --target=x86_64-apple-darwin 2>&1 | compare %f
//  ASSERT: regex warning.*: '--apc' is not supported when targeting darwin.

main() {
    return 0
}
