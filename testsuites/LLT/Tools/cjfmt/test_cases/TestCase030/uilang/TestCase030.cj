// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//定义
enum RGBColor {
    | Red | Green | Blue(UInt8,String) //3个构造器：第一个 | 可以不写

   // 还可以
   // 支持
   | Red(UInt8) | Green(UInt8) | Blue(UInt8)
}

enum Expr {
    | Num(Int64)
    | Add(Expr,Expr) //调用自己
    | Sub(Expr,Expr)
}

main(){}