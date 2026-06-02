/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords
func test2() {
    var abstract = 1
    var open =2
    var override = 3
    var private = 4
    var protected = 5
    let public = 6
    let redef = 7

    var a1 = abstract+open
    var a2 = protected+redef
    if (abstract>1) {
        let a3 = 8
    }
}
