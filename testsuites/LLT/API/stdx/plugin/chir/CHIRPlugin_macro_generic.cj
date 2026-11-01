/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan CHIRPlugin cannot be applied to a generic class.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.plugin.*
import stdx.chir.*

@CHIRPlugin
class GenPlugin<T> where T <: ToString {
    public override func run(pkg: Package): Bool {
        let _ = pkg
        return true
    }
}

main() {}
