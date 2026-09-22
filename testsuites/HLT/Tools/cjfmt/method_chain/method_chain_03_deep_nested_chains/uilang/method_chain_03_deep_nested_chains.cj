/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Node {
    public func core(): Node {
        return this
    }
    public func leaf(): Node {
        return this
    }
    public func b(): Node {
        return this
    }
    public func d(): Node {
        return this
    }
    public func e(): Node {
        return this
    }
    public func value(): Int64 {
        return 0
    }
    public func finish(x: Int64, y: Int64): Int64 {
        return x
    }
    public func filter(x: Int64): Node {
        return this
    }
    public func map(x: Int64): Node {
        return this
    }
}

class Cache {
    public func get(k: Int64): Cache {
        return this
    }
}

func wrap(n: Node): Node {
    return n
}

func inner(): Node {
    return Node()
}

func outer(x: Int64, y: Int64): Int64 {
    return x
}

func build(n: Node, x: Int64): Int64 {
    return x
}

func a(): Node {
    return Node()
}

func trim(n: Node): Int64 {
    return 0
}

func c(): Node {
    return Node()
}

func matrix(x: Int64): Int64 {
    return x
}

func rows(x: Int64, y: Int64): Int64 {
    return x
}

func cols(x: Int64, y: Int64): Int64 {
    return y
}

func store(x: Int64, c: Cache): Int64 {
    return x
}

func sink(n: Node): Int64 {
    return 0
}

func source(): Node {
    return Node()
}

func f1(): Int64 {
    return 1
}

func f2(): Int64 {
    return 2
}

func m(): Int64 {
    return 3
}

main() {
    let items = [Node(), Node()]
    let cache = Cache()
    let k1 = 1
    let k2 = 2
    let r = wrap( inner() . core() . leaf() ).finish( 1,2 )
    let s = outer( build( a() . b(), 1 ), trim( c() . d() . e() ) )
    let t = matrix( rows( 2, cols( 3, 4 ) ) )
    let u = store( items[0].value( ), cache.get( k1 ) . get( k2 ) )
    let v = sink( source().filter( f1() ) . filter( f2() ) .map( m() ) )
    println(r)
    println(s)
    println(t)
    println(u)
    println(v)
}
