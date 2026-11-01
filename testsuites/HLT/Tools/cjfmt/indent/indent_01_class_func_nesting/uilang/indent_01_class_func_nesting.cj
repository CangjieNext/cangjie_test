/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Shape {
      let name: String = "shape"
  public init() {
  }
        public func area(): Int64 {
    return 1
        }
  public func perimeter(): Int64 {
        return 2
  }
}

func maxValue(a: Int64, b: Int64): Int64 {
        if (a > b) {
            return a
        }
    if (a < b) {
                return b
    }
    return 0
}

func loops(): Unit {
    for (i in 1..3) {
            for (j in 1..3) {
        println("${i}, ${j}")
            }
    }
    var n = 0
    while (n < 2) {
        n = n + 1
    }
    do {
        n = n - 1
    } while (n > 0)
}

main() {
    let s = Shape()
    println(s.area())
    println(maxValue(1, 2))
    loops()
}
