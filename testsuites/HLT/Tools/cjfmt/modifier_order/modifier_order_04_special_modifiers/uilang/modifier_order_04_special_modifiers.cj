/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

sealed abstract class SC {
    public func m(): Unit {
        println("sealed")
    }
}

internal class IC {
    public func m(): Unit {
        println("ic")
    }
}

open class PC {
    open protected func pf(): Unit {
        println("pf")
    }
}

class PC2 <: PC {
    override protected func pf(): Unit {
        println("pc2")
    }
}

class KV {
    static public let GOLD: Int64 = 1

    static protected let SILVER: Int64 = 2

    public func sum(): Int64 {
        return KV.GOLD + KV.SILVER
    }
}

main() {
    IC().m()
    PC2().pf()
    println("${KV().sum()}")
}
