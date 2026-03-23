/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mod1 mod2
// EXEC-PIPE: %compiler -p mod2/src/pkgA  %compile_lib_opt -o mod2/pkgA.o
// EXEC-PIPE: %compiler -p mod1/src/pkgB  %compile_lib_opt -o mod1/pkgB.o
// EXEC-PIPE: %compiler -p mod1/src/pkgA --import-path mod1 --import-path mod2 %compile_lib_opt -o mod1/pkgA.o
// EXEC-PIPE: %compiler --scan-dependency mod1/pkgA.cjo  2>&1 | compare %f
// ASSERT: scan {"package":"pkgA","isMacro":false,"accessLevel":"public","dependencies":[{"package":"mod2.pkgA","isStd":false,"imports":[{"file":"pkgA.cj","begin":{"line":12,"column":1},"end":{"line":12,"column":17}}]},{"package":"pkgB","isStd":false,"imports":[{"file":"pkgA.cj","begin":{"line":11,"column":1},"end":{"line":11,"column":12}}]}],"features":[],"product":true}
