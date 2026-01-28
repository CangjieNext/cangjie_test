// DEPENDENCE: pkg pkg01 mod
// EXEC: %compiler %cmp_opt --scan-dependency -p pkg/  2>&1 | compare %f
// (not Windows) ASSERT: scan {"package":"pkg","isMacro":false,"accessLevel":"public","dependencies":[{"package":"mod.pkg02","isStd":false,"imports":[{"file":"pkg/a.cj","begin":{"line":3,"column":1},"end":{"line":3,"column":28}}]},{"package":"pkg01","isStd":false,"imports":[{"file":"pkg/a.cj","begin":{"line":2,"column":1},"end":{"line":2,"column":24}}]}],"features":[],"product":true}
// (Windows) ASSERT: scan {"package":"pkg","isMacro":false,"accessLevel":"public","dependencies":[{"package":"mod.pkg02","isStd":false,"imports":[{"file":"pkg\\\\a.cj","begin":{"line":3,"column":1},"end":{"line":3,"column":28}}]},{"package":"pkg01","isStd":false,"imports":[{"file":"pkg\\\\a.cj","begin":{"line":2,"column":1},"end":{"line":2,"column":24}}]}],"features":[],"product":true}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

