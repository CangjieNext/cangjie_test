// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt --output-type=staticlib %pkg_opt pkg -o pkg.%middle
// EXEC-PIPE-1: %compiler --scan-dependency -p pkg/ pkg.cjo 2>&1 | compare %f
// ASSERT: regex error.* not accept .cjo inputs when '-p' or '--package' is specifie
