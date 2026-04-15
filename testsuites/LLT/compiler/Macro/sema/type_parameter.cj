// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_cffi_cannot_have_type_param
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)

import define.*

@C
struct Data<T> {
    var a: Int64 = 0
}

main() {
    @M1
    var d0 = Data<Int64>()
    0
}

