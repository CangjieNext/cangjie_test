/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package plugin_func_count

import stdx.chir.*
import stdx.plugin.*

@CHIRPlugin
class FuncCountPlugin {
    public override func run(pkg: Package): Bool {
        var count = 0
        for (f in pkg.functions) {
            if (f.isImported() || f.isCompilerAdd()) {
                continue
            }
            count++
        }
        println("function count: ${count}")
        return true
    }
}
