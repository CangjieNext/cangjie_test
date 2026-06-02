// LEVEL: 0
// DEPENDENCE: pkg
// EXEC-PIPE-1: %compiler %compile_lib_opt pkg/a.cj pkg/b.cj pkg/c.cj 2>&1 | compare %f
// ASSERT: regex a\.cj and c\.cj might have file circular dependency

main() {
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
