// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: core/mock.cj
// EXEC: %mkdir core
// EXEC: %move mock.cj core/
// EXEC: %cpfile %f core/main.cj
// EXEC: %frontendCompiler --no-prelude -Woff all %typecheck --package core

// std.core 内 rawArrayAllocate + rawArrayInitByValue 走通用 ChkCallExpr（非 ChkArrayCall）。
package std.core

main(): Int64 {
    let raw = rawArrayAllocate<Int64>(3)
    rawArrayInitByValue(raw, 3, 7)
    return arraySize(raw)
}
