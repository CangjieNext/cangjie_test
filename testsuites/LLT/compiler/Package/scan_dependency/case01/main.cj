// DEPENDENCE: pkg pkg01 mod
// EXEC: %compiler %cmp_opt %pkg_opt pkg01 %compile_lib_opt -o pkg01.%middle
// EXEC: %compiler %cmp_opt %pkg_opt mod/pkg02 --module-name=mod %compile_lib_opt -o mod/pkg02.%middle
// EXEC: %compiler %cmp_opt %pkg_opt pkg %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %cmp_opt --scan-dependency pkg.cjo  2>&1 | compare %f
// ASSERT: scan {"package":"pkg","isMacro":false,"accessLevel":"public","dependencies":[{"package":"mod.pkg02","isStd":false,"imports":[{"file":"a.cj","begin":{"line":3,"column":1},"end":{"line":3,"column":28}}]},{"package":"pkg01","isStd":false,"imports":[{"file":"a.cj","begin":{"line":2,"column":1},"end":{"line":2,"column":24}}]}],"features":[],"product":true}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

