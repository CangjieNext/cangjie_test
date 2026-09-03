/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -Woff unused -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// @CHIRPlugin on richer class AST (modifiers, members, extra init)

/* SCAN
rich name: RichPlugin
rich run: demo 2
extra init: 7
*/

import stdx.plugin.*
import stdx.chir.*

@CHIRPlugin
public open class RichPlugin {
    public var x: Int64 = 1
    public let y: Int64 = 2
    public mut prop p: Int64 {
        get() {
            this.x
        }
        set(v) {
            this.x = v
        }
    }
    public static func dummy(): Int64 {
        1
    }
    public func bump(): Unit {
        this.p = this.p + dummy()
    }
    public override func run(pkg: Package): Bool {
        this.bump()
        println("rich run: ${pkg.name} ${this.p}")
        return true
    }
}

@CHIRPlugin
class ExtraInitPlugin {
    public init(n: Int64) {
        super("ExtraInitPlugin")
        this.n = n
    }
    public var n: Int64 = 0
    public override func run(pkg: Package): Bool {
        let _ = pkg
        return this.n > 0
    }
}

main() {
    let pkg = Package("demo", AccessLevel.Public)
    let rich = RichPlugin()
    println("rich name: ${rich.name}")
    let _ = rich.run(pkg)
    let extra = ExtraInitPlugin(7)
    println("extra init: ${extra.n}")
}
