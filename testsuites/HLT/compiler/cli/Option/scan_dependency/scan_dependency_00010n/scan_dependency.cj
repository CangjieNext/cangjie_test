/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkgA
// EXEC-PIPE: %compiler --scan-dependency -p pkgA | compare %f
// ASSERT: regex {"package":"pkgA","isMacro":false,"accessLevel":"public","dependencies":\[{"package":"mod2","isStd":false,"imports":\[{"file":"pkgA(/|\\\\)pkgA.cj","begin":{"line":11,"column":1},"end":{"line":11,"column":12}}\]}\],"std-dependencies":\[{"std.core":\[\]}\],"features":\[\],"product":true}
