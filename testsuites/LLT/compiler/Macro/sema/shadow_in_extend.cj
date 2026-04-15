// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 sema_extend_member_cannot_shadow
// ASSERT: scan the error originates in the macro `ShadowInExtend` (consider using `--debug-macro` for more info)

import define.*

class A {
    public func f(): Unit {}
}

@ShadowInExtend
extend A {
    public func f1(): Unit {}
}

main() {}
