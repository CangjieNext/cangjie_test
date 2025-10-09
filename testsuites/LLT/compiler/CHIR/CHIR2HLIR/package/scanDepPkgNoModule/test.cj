// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler -p . --scan-dependency 2>&1 | compare %f
// (not Windows) ASSERT: regex {"package":"scanDepPkgNoModule","isMacro":false,"accessLevel":"public","dependencies":[{"package":"d","isStd":false,"imports":[{"file":"./test.cj","begin":{"line":[0-9]+,"column":1},"end":{"line":[0-9]+,"column":20}}]}],"features":[]}
// (Windows) ASSERT: regex {"package":"scanDepPkgNoModule","isMacro":false,"accessLevel":"public","dependencies":[{"package":"d","isStd":false,"imports":[{"file":".\\test.cj","begin":{"line":[0-9]+,"column":1},"end":{"line":[0-9]+,"column":20}}]}],"features":[]}
package scanDepPkgNoModule

internal import d.*
