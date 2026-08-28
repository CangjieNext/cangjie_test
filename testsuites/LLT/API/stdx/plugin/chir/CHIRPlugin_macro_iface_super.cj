/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt %f -o %output 2>&1 | compare %f
// @CHIRPlugin 扫描已有 RefType 父类型（非 CHIRPluginBase）后追加基类
// ASSERT: scan super class 'CHIRPluginBase' must be placed at the beginning of supertype list
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import stdx.plugin.*
import stdx.chir.*

interface Marker {}

@CHIRPlugin
class WithIface <: Marker {
    public override func run(pkg: Package): Bool {
        return true
    }
}

main() {}
