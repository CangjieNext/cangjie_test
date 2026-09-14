/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package aspect_pkg

import stdx.aspect_cj.*
import state_pkg.*

@InsertAtEntry[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func crossAspect(): Unit {
    // Observes state_pkg init, which only runs if aspect_pkg's package init ran
    // (inserted by weave's callUpstreamPkgInitFunc createApply, or via import).
    println("ready=${readReady()}")
    println("#----- cross aspect -----#")
}
