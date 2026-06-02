/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.contextKeywords

class protected{
    public protected(a:Int64,public:Float64){}
    public var redef:Int64=0

}

func test13(){
    var b1 = protected(1, 2.0)
    b1.redef
}
