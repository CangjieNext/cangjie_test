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

func test0(): Int16 {
    var a: Array<Int16> = Array<Int16>(100000) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100000) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100000) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -22884 || sum[8] != 8188 || sum[7] != -26276 || sum[6] != 4796 || sum[5] != -29668 || sum[4] != 1404 ||
        sum[3] != 32476 || sum[2] != -1988 || sum[1] != 29084 || sum[0] != -5380) {
        return 1
    }
    return 0
}

func test1(): Int16 {
    var a: Array<Int16> = Array<Int16>(100001) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100001) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100001) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -27732 || sum[8] != 3339 || sum[7] != -31126 || sum[6] != -55 || sum[5] != 31016 || sum[4] != -3449 ||
        sum[3] != 27622 || sum[2] != -6843 || sum[1] != 24228 || sum[0] != -10237) {
        return 1
    }
    return 0
}

func test2(): Int16 {
    var a: Array<Int16> = Array<Int16>(100002) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100002) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100002) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != -32579 || sum[8] != -1509 || sum[7] != 29561 || sum[6] != -4905 || sum[5] != 26165 || sum[4] != -8301 ||
        sum[3] != 22769 || sum[2] != -11697 || sum[1] != 19373 || sum[0] != -15093) {
        return 1
    }
    return 0
}

func test3(): Int16 {
    var a: Array<Int16> = Array<Int16>(100003) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100003) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100003) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 28111 || sum[8] != -6356 || sum[7] != 24713 || sum[6] != -9754 || sum[5] != 21315 || sum[4] != -13152 ||
        sum[3] != 17917 || sum[2] != -16550 || sum[1] != 14519 || sum[0] != -19948) {
        return 1
    }
    return 0
}

func test4(): Int16 {
    var a: Array<Int16> = Array<Int16>(100004) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100004) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100004) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 23266 || sum[8] != -11202 || sum[7] != 19866 || sum[6] != -14602 || sum[5] != 16466 || sum[4] != -18002 ||
        sum[3] != 13066 || sum[2] != -21402 || sum[1] != 9666 || sum[0] != -24802) {
        return 1
    }
    return 0
}

func test5(): Int16 {
    var a: Array<Int16> = Array<Int16>(100005) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100005) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100005) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 18422 || sum[8] != -16047 || sum[7] != 15020 || sum[6] != -19449 || sum[5] != 11618 || sum[4] != -22851 ||
        sum[3] != 8216 || sum[2] != -26253 || sum[1] != 4814 || sum[0] != -29655) {
        return 1
    }
    return 0
}

func test6(): Int16 {
    var a: Array<Int16> = Array<Int16>(100006) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100006) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100006) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 13579 || sum[8] != -20891 || sum[7] != 10175 || sum[6] != -24295 || sum[5] != 6771 || sum[4] != -27699 ||
        sum[3] != 3367 || sum[2] != -31103 || sum[1] != -37 || sum[0] != 31029) {
        return 1
    }
    return 0
}

func test7(): Int16 {
    var a: Array<Int16> = Array<Int16>(100007) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100007) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100007) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 8737 || sum[8] != -25734 || sum[7] != 5331 || sum[6] != -29140 || sum[5] != 1925 || sum[4] != -32546 ||
        sum[3] != -1481 || sum[2] != 29584 || sum[1] != -4887 || sum[0] != 26178) {
        return 1
    }
    return 0
}

func test8(): Int16 {
    var a: Array<Int16> = Array<Int16>(100008) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(100008) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(100008) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 3896 || sum[8] != -30576 || sum[7] != 488 || sum[6] != 31552 || sum[5] != -2920 || sum[4] != 28144 ||
        sum[3] != -6328 || sum[2] != 24736 || sum[1] != -9736 || sum[0] != 21328) {
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
        println("0")
        return 1
    }
    if (rslt1 != 0) {
        println("1")
        return 1
    }
    if (rslt2 != 0) {
        println("2")
        return 1
    }
    if (rslt3 != 0) {
        println("3")
        return 1
    }
    if (rslt4 != 0) {
        println("4")
        return 1
    }
    if (rslt5 != 0) {
        println("5")
        return 1
    }
    if (rslt6 != 0) {
        println("6")
        return 1
    }
    if (rslt7 != 0) {
        println("7")
        return 1
    }
    if (rslt8 != 0) {
        println("8")
        return 1
    }
    return 0
}
