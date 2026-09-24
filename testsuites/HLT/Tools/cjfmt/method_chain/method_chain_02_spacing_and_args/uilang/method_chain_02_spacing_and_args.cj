/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Store {
    public func items(): Store {
        return this
    }
    public func pick(n: Int64, m: Int64): Store {
        return this
    }
    public func pack(tag: String): Store {
        return this
    }
    public func count(): Int64 {
        return 0
    }
}

main() {
    let a = Store ()  .  items () . pick ( 1,2 ) . pack ( "box" )
    let b = Store().items().pick(3, 4).pack("bag")
    let c = Store ( ) . items ( ) . pick ( 5 , 6 ) . pack ( "crate" )
    let d = Store().items().items().pick(7, 8).items().pack("sack")
    let decoy = Store().pack("x . y ( 1 , 2 ) + z")
    let s = 1 ;  let t = 2 ;
    println(a.items().pack("done").items().pack("ok").count())



    println(b.count())
    println(c.count())
    println(d.count())
    println(decoy.count())
    println(s + t)
}
