/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

class C5{
    func abstract(){}
    func public(){}
    func redef(a:Int64){}
    func get(){}
}

func test9(){
    var a1 = C5().redef(8)
}
