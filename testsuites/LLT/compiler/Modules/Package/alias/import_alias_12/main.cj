// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1 pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg1 -o pkg1.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %pkg_opt %diag_json pkg2 -o pkg2.%middle

// ASSERT: scan package_search_error
