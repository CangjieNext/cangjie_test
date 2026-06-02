// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../empty
// EXEC: %compiler %pkg_opt empty 2>&1 | compare %f
// EXPECTED: regex-not error
// EXPECTED: regex-not core dumped

main() {
    0
}
