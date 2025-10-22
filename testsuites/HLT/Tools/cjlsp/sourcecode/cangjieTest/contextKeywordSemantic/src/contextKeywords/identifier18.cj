/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

func test18(){
    var public = 1
    var private = 2

    let a = (1, (), (), 3)
    var result = match (a) {
       case (1,private,protected, open) => ""
       case _ => ""
    }

}
