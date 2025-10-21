/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

import default.Class.pkgs.*

func test1() {
    var data = Dataa()
    var a = Dataa.a
    var b = data.b.b
    let b2 = Dataa().b.b
    let c = Dataa().c
    let d = data.b.b
}
