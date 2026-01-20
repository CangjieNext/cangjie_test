// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class AA{
    var a = 1
}

class ABC{
    var a = 1
    var b = Some(AA())
}

func test(a:Int8)
{
    a
}

main()
{
    var a = test
    var cls = Some(AA())
    var arr1 = Some([1, 2, 3])
    var arr2 = Some([ABC(), ABC(), ABC()])
    var arr3 = Some([(),(),()])
    var tup = Some((1, 1.1 , (), ABC()))
    0
}
