/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Op {
    | Add(Int64, Int64)
    | Sub(Int64, Int64)
}

func calc(op: Op): Int64 {
    match (op) {
        case Add(a, b) => a + b
        case Sub(a, b) =>
                a - b
    }
}

func risky(n: Int64): Int64 {
    try {
                if (n < 0) {
            throw Exception("negative")
        }
        return n
    }
    catch (e: Exception) {
        println("caught")
            return 0
        }
    finally {
                println("finally")
    }
}

main() {
    println(calc(Add(3, 4)))
    println(risky(5))
    println(risky(-1))
}
