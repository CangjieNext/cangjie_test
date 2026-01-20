// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class ABC 
{
    var a = 1
    var b = "123"
}

struct BCD
{
    var a = 1
    var b = "123"    
}

var i64:Any = 55
var str:Any = "123"


main() {
    let tup:Any = (1, "123", true, ABC())
    let arr:Any = [1,2,3]
    let cls:Any = ABC()
    var stru:Any = BCD()
    0
}
