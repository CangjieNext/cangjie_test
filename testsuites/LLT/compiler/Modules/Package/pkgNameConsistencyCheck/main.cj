// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ModuleName
// EXEC: %compiler %cmp_opt -p ModuleName/directory_0/directory_1 --module-name ModuleName %compile_lib_opt --output ./ModuleName/p.%middle
// EXEC: cd ModuleName && %move ModuleName.directory_0.directory_1.cjo ModuleName.directory_0.directory_11.cjo && cd ..
// EXEC-PIPE-1: %compiler %cmp_opt ./ModuleName/p.%middle %n.cj 2>&1 | compare %f
// ASSERT: regex The imported cjo file failed verification, the package name

internal import ModuleName.directory_0.directory_11.*

main() {
    a_ + b_
}
