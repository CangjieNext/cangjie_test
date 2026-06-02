// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct ABC {
    var a = 1
}

func func1()
{
    0
}

func func2(a:Int64)
{
    a
}

func func3(a:ABC)
{
    a
}

func func4(para:(Int64)->Int64) 
{
    para(5)
}

main()
{
  var a = Some(ABC())
  var f1 = Some(func1)
  var f2 = Some(func2)
  var f3 = Some(func3)
  var f4 = Some(func4)
  0
}