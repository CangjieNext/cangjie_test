/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

class C4{}
extend C4{
    func extendfunc(a:Float32){}
}

func test17(){
    var i1 = C4().extendfunc(3.0)

}
