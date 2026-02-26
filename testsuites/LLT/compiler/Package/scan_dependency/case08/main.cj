// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: src
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt src/sub -o src.sub.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt src src.sub.%middle
// EXEC: %compiler --scan-dependency src.cjo 2>&1 | compare %f
// ASSERT: scan "std-dependencies":[{"std.ast":["std.collection","std.core"]},{"std.collection":["std.core","std.math"]},{"std.core":[]},{"std.math":["std.core"]}]
