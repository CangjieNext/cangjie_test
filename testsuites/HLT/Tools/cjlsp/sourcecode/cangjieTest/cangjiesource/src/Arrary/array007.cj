/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Arrary

//模式匹配表达式
func test7(){
    var i = 0
    var arr = [1,2,3,4]
    match (i) {
        case _ => arr
    }
}
