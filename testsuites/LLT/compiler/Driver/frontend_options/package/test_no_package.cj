// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC:%compiler -p 2>&1 | compare %f
// ASSERT: regex error.*expected one package path to build

internal import path.package01.*

main() {
    printInfo()
}
