// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: core_mock.cj
// EXEC: %mkdir core
// EXEC: %move core_mock.cj core/
// EXEC: %cpfile %f core/main.cj
// EXEC: %frontendCompiler --no-prelude -Woff all %typecheck --package core

// std.core 内 rawArrayAllocate + arrayInitByFunction 走通用 ChkCallExpr。
package std.core

main(): Int64 {
    let raw = rawArrayAllocate<Int64>(3)
    arrayInitByFunction(raw, {i => i + 1})
    if (arrayGet(raw, 0) != 1 || arrayGet(raw, 1) != 2 || arrayGet(raw, 2) != 3) {
        return 1
    }
    return 0
}
