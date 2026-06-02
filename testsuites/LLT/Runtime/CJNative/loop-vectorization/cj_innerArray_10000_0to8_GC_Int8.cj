// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.runtime.*
import std.sync.*

func test0(): Int8 {
    var a: Array<Int8> = Array<Int8>(10000) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10000) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10000) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 57 || sum[8] != 41 || sum[7] != 25 || sum[6] != 9 || sum[5] != -7 || sum[4] != -23 || sum[3] != -39 ||
        sum[2] != -55 || sum[1] != -71 || sum[0] != -87) {
        return 1
    }
    return 0
}

func test1(): Int8 {
    var a: Array<Int8> = Array<Int8>(10001) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10001) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10001) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 82 || sum[8] != 65 || sum[7] != 48 || sum[6] != 31 || sum[5] != 14 || sum[4] != -3 || sum[3] != -20 ||
        sum[2] != -37 || sum[1] != -54 || sum[0] != -71) {
        return 1
    }
    return 0
}

func test2(): Int8 {
    var a: Array<Int8> = Array<Int8>(10002) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10002) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10002) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 108 || sum[8] != 90 || sum[7] != 72 || sum[6] != 54 || sum[5] != 36 || sum[4] != 18 || sum[3] != 0 ||
        sum[2] != -18 || sum[1] != -36 || sum[0] != -54) {
        return 1
    }
    return 0
}

func test3(): Int8 {
    var a: Array<Int8> = Array<Int8>(10003) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10003) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10003) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -121 || sum[8] != 116 || sum[7] != 97 || sum[6] != 78 || sum[5] != 59 || sum[4] != 40 || sum[3] != 21 ||
        sum[2] != 2 || sum[1] != -17 || sum[0] != -36) {
        return 1
    }
    return 0
}

func test4(): Int8 {
    var a: Array<Int8> = Array<Int8>(10004) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10004) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10004) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -93 || sum[8] != -113 || sum[7] != 123 || sum[6] != 103 || sum[5] != 83 || sum[4] != 63 || sum[3] != 43 ||
        sum[2] != 23 || sum[1] != 3 || sum[0] != -17) {
        return 1
    }
    return 0
}

func test5(): Int8 {
    var a: Array<Int8> = Array<Int8>(10005) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10005) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10005) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -64 || sum[8] != -85 || sum[7] != -106 || sum[6] != -127 || sum[5] != 108 || sum[4] != 87 || sum[3] !=
        66 || sum[2] != 45 || sum[1] != 24 || sum[0] != 3) {
        return 1
    }
    return 0
}

func test6(): Int8 {
    var a: Array<Int8> = Array<Int8>(10006) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10006) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10006) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -34 || sum[8] != -56 || sum[7] != -78 || sum[6] != -100 || sum[5] != -122 || sum[4] != 112 ||
        sum[3] != 90 || sum[2] != 68 || sum[1] != 46 || sum[0] != 24) {
        return 1
    }
    return 0
}

func test7(): Int8 {
    var a: Array<Int8> = Array<Int8>(10007) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10007) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10007) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -3 || sum[8] != -26 || sum[7] != -49 || sum[6] != -72 || sum[5] != -95 || sum[4] != -118 || sum[3] !=
        115 || sum[2] != 92 || sum[1] != 69 || sum[0] != 46) {
        return 1
    }
    return 0
}

func test8(): Int8 {
    var a: Array<Int8> = Array<Int8>(10008) {i => Int8(2 * i)}
    var b: Array<Int8> = Array<Int8>(10008) {i => Int8(3 * i)}
    var c: Array<Int8> = Array<Int8>(10008) {i => Int8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int8> = Array<Int8>(outterLoopCnt) {i => Int8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 29 || sum[8] != 5 || sum[7] != -19 || sum[6] != -43 || sum[5] != -67 || sum[4] != -91 || sum[3] != -115 ||
        sum[2] != 117 || sum[1] != 93 || sum[0] != 69) {
        return 1
    }
    return 0
}

var finished = AtomicBool(false)

main() {
    var f = spawn {
        while (!finished.load()) {
            GC()
            println("trigger gc")
        }
    }
    var rslt0 = test0()
    var rslt1 = test1()
    var rslt2 = test2()
    var rslt3 = test3()
    var rslt4 = test4()
    var rslt5 = test5()
    var rslt6 = test6()
    var rslt7 = test7()
    var rslt8 = test8()

    finished.store(true)
    f.get()

    if (rslt0 != 0) {
        return 1
    }
    if (rslt1 != 0) {
        return 1
    }
    if (rslt2 != 0) {
        return 1
    }
    if (rslt3 != 0) {
        return 1
    }
    if (rslt4 != 0) {
        return 1
    }
    if (rslt5 != 0) {
        return 1
    }
    if (rslt6 != 0) {
        return 1
    }
    if (rslt7 != 0) {
        return 1
    }
    if (rslt8 != 0) {
        return 1
    }
    return 0
}
