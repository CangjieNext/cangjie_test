// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_macro define.cj
// ERRCHECK: %run_macro %set_stdx_path %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 parse_expected_decl
// ASSERT: scan the error originates in the macro `Same` (consider using `--debug-macro` for more info)

import define.*

@Same(
import stdx.net.http.*
main() {
    return 0
}
)
