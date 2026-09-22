/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Route {
    public func next(): Route {
        return this
    }
    public func target(): Int64 {
        return 0
    }
}

class Net {
    public var routes: Array<Route> = [Route(), Route()]
    public func network(): Net {
        return this
    }
}

let app = Net()

func f1(x: Int64): Int64 {
    return x
}

func f2(x: Int64, y: Int64): Int64 {
    return x
}

func f3(x: Int64, y: Int64): Int64 {
    return x
}

func f4(x: Int64): Int64 {
    return x
}

func f5(x: Int64, y: Int64): Int64 {
    return y
}

func f6(x: Int64): Int64 {
    return x
}

func f7(x: Int64): Int64 {
    return x
}

func wrap(x: Int64, y: Int64): Int64 {
    return x
}

func item(arr: Array<Int64>): Int64 {
    return arr.size
}

func tag(x: Int64): Int64 {
    return x
}

func depth(a: Int64, b: Int64, c: Int64, d: Int64): Int64 {
    let nested = f1(f2(f3(f4(a), f5(b, f6(c))), f7(d)))
    let grid = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
    let pair = ((a, (b, c)), (d, a))
    let tail = [1, 2]
    let mixed = wrap(item([1, 2, 3, 4]), item([tag(1), tag(tag(2))]))
    let cfg = app.network().routes[0].next().target()
    return nested + grid[0][1][0] + pair[0][1][0] + tail.size
}

main() {
    println(depth(1, 2, 3, 4))
}
