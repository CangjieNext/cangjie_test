// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan the warning originates in the macro `MatchSome` (consider using `--debug-macro` for more info)

import define.*

main() {
    @MatchSome
    let x = 1
    x
}
