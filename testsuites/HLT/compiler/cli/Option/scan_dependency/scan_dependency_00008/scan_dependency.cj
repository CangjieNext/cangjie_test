/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkgA
// EXEC-PIPE: %compiler --scan-dependency -p pkgA  2>&1 | compare %f
// ASSERT: regex {"package":"pkgA","isMacro":false,"accessLevel":"public","dependencies":\[{"package":"mod2","orPackage":"mod2.pkgA","isStd":false,"imports":\[{"file":"pkgA(/|\\\\)pkgA.cj","begin":{"line":12,"column":1},"end":{"line":12,"column":17}}\]},{"package":"mod3","orPackage":"mod3.pkgA","isStd":false,"imports":\[{"file":"pkgA(/|\\\\)pkgA.cj","begin":{"line":13,"column":1},"end":{"line":13,"column":17}}\]},{"package":"pkgB","isStd":false,"imports":\[{"file":"pkgA(/|\\\\)pkgA.cj","begin":{"line":11,"column":1},"end":{"line":11,"column":12}}\]}\],"features":\[\],"product":true}
