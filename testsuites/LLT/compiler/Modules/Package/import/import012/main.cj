// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: json pkg
// EXEC: %compiler %cmp_opt %pkg_opt json/ %compile_lib_opt -o json.%middle
// EXEC: %compiler %cmp_opt %pkg_opt pkg/ %compile_lib_opt -o pkg.%middle
// EXEC: %rmfile json.cjo
// ERRCHECK: %compiler %cmp_opt %diag_json %f

import pkg.*

// ASSERT: scan package_search_error
