// DEPENDENCE: src
// EXEC: %compiler %cmp_opt --scan-dependency -p src 2>&1 | compare %f
// ASSERT: scan {"package":"default","isMacro":false,"accessLevel":"public","dependencies":[],"features":["os.Harmony","os.Linux","os.Mac"],"product":true}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

