// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_attr_tokens_definition.cj
// EXEC: %compiler %cmp_macro macro_attr_tokens_definition.cj
// EXEC-PIPE: %run_macro %compiler %cmp_opt %f -o %output | compare %f
// ASSERT: scan value = State, kind = IDENTIFIER
// ASSERT: scan hasAttr = true
// ASSERT: scan value = Binding, kind = STRING_LITERAL
// ASSERT: scan hasAttr = true

import define.*

@AttrKind
@Attribute[State]
var cnt = 0

@AttrKind
@Attribute["Binding"]
var bcnt = 0

main(): Int64 {
    return 0
}
