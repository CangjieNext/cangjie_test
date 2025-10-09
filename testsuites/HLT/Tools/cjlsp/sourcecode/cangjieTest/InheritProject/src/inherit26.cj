/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.*

struct S2 <: I10{
    public func size1_1():Unit {}
}
struct S3 <: I10{
    override public func size1_1():Unit {}
}

func test26(){
    var a = S2().size1_1
    var b = S3().size1_1()
}
