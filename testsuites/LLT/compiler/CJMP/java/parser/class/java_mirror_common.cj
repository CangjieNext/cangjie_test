// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-0: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// Check: @JavaMirror is allowed on a common class (CJMP feature)
// ASSERT: scan-not error
package cmp

import java.lang.*

@JavaMirror
public common open class A {
    init()
}
