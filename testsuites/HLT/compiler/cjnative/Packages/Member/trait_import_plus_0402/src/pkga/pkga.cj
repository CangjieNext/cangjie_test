/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public trait Color {
    func addcolor(a: This,b:Int64):Int64
}

public var a:Fruit = Fruit(1)

append Fruit with Color {
    func addcolor(a: Fruit,b:Int64): Int64 {
        return a.name + b
    }
}

public class Fruit  {
  public var name : Int64
  public init(x:Int64) {
    name = x
  }
}