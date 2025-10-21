/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords
class C1{
    var abstract = 1
    var open =2
    var override = 3
    var private = 4
    var protected = 5
    let public = 6
    let redef = 7
}

struct S1{
    var abstract = 1
    var open =2
    var override = 3
    var private = 4
    var protected = 5
    let public = 6
    let redef = 7
}

func test3(){
    var c1 = C1().abstract
    var c2 = S1().override
}
