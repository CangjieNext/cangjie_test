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
            // Count this package's source declarations, not O2-materialized
            // std.core bodies or concrete copies of generic class members.
            if (f.packageName != pkg.name || f.isImported() || f.isCompilerAdd()) {
                continue
            }
            if (let Some(parent) <- f.declaredParent) {
                if (parent.genericDecl.isSome()) { continue }
            }
            count++
        }
        println("function count: ${count}")
        return true
    }
}
