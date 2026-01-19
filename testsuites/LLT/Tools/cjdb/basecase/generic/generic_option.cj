// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test<T>(para:T)
{
    var a = para
    a
}

class ABC
{
    var a = 1
    var b = Some(1)
}

main()
{
    var opt_int8:Option<Int8> = Some(123)
    var opt_none:Option<Int64> = None
    var opt_cls = Some(ABC())
    test(opt_int8)
    test(opt_none)
    test(opt_cls)
    opt_cls = None
    test(opt_cls)
    var str = test("aaa")
    0
}