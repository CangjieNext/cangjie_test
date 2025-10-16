// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ModuleName1
// EXEC: %compiler %cmp_opt -p ModuleName1/directory_0/directory_1 --module-name ModuleName %compile_lib_opt --output ./ModuleName1/p.%middle
// EXEC: %compiler %cmp_opt --module-name ModuleName1 ./ModuleName1/p.%middle %n.cj

internal import ModuleName1.directory_0.directory_1.*

main() {
    a_ + b_
}
