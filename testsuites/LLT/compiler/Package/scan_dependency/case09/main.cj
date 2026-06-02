// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: src
// EXEC: %compiler --scan-dependency -p src 2>&1 | compare %f
// ASSERT: scan "std-dependencies":[{"std.collection":["std.core","std.math"]},{"std.core":[]},{"std.math":["std.core"]}]
