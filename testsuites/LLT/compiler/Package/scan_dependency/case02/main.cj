// DEPENDENCE: mod1 mod2 pkg
// EXEC: %compiler %cmp_opt %pkg_opt mod1/pkg01 --module-name=mod1 %compile_lib_opt -o mod1/pkg01.%middle
// EXEC: %compiler %cmp_opt %pkg_opt mod2/pkg02 --module-name=mod2 %compile_lib_opt -o mod2/pkg02.%middle
// EXEC: %compiler %cmp_opt %pkg_opt --module-name=mod pkg %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %cmp_opt --scan-dependency pkg.cjo  2>&1 | compare %f
// ASSERT: scan {"package":"pkg","isMacro":true,"accessLevel":"public","dependencies":[{"package":"mod1.pkg01","isStd":false,"imports":[{"file":"a.cj","begin":{"line":2,"column":1},"end":{"line":2,"column":29}}]},{"package":"mod2.pkg02","isStd":false,"imports":[{"file":"a.cj","begin":{"line":3,"column":1},"end":{"line":3,"column":29}}]}],"std-dependencies":[{"std.core":[]}],"features":[],"product":true}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

