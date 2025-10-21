/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.D1

class A1<:Any{}

class AAS{
    public var aa:Int64 =0
}

func test1() {
    var ii:Any= AAS()
    var ii1= AAS()
    ii1.aa
}
