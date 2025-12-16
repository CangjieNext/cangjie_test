/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkgA mod2
// EXEC-PIPE: %compiler -p mod2/src/pkgB  %compile_lib_opt -o mod2/pkgB.o
// EXEC-PIPE: %compiler -p mod2/src/pkgC  %compile_lib_opt -o mod2/pkgC.o
// EXEC-PIPE: %compiler -p pkgA --import-path mod2 %compile_lib_opt
// EXEC-PIPE: %compiler --scan-dependency pkgA.cjo 2>&1 | compare %f
// ASSERT: scan {"package":"pkgA","isMacro":false,"accessLevel":"public","dependencies":[{"package":"mod2.pkgB","isStd":false,"imports":[{"file":"pkgA.cj","begin":{"line":11,"column":9},"end":{"line":11,"column":20}}]},{"package":"pkgC","isStd":false,"imports":[{"file":"pkgA.cj","begin":{"line":11,"column":22},"end":{"line":11,"column":26}}]}],"features":[],"product":true}

