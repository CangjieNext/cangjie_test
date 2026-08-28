/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package aspect_side

import stdx.aspect_cj.*

@InsertAtEntry[packageName: "default", className: "", methodName: "woven", isStatic: false,
    recursive: false, funcTypeStr: "()->Unit"]
public func crossAspect(): Unit {
    println("#----- cross aspect -----#")
}
