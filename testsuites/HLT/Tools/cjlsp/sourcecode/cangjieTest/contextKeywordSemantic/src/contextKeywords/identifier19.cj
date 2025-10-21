/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

func test19(){
    var public = 1
    var private = public  + 1
    if (public == 2) {
        return 0 
    }
    if (private == 2) {
        private++
    }
    return 0
}
