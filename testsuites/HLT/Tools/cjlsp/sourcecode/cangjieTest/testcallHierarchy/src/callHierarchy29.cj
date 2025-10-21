/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

import  default.pkg.*

class C1{
    func h1(){
        var a = fh1()
    }
}
func f1(){}
func f2(){
    f1()
    var a1 = C1().h1
}
