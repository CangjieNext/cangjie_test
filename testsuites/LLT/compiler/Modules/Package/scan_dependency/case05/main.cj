// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt a
// EXEC: %compiler --scan-dependency a.cjo 2>&1 | compare %f
// ASSERT: scan {"package":"a","isMacro":false,"accessLevel":"public","dependencies":[],"std-dependencies":[{"std.core":[]}],"features":[],"product":true}
