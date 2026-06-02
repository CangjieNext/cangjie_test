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

func test0(): Int64 {
    var a: Array<Int64> = Array<Int64>(10000) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10000) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10000) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50085000 || sum[8] != 50075000 || sum[7] != 50065000 || sum[6] != 50055000 || sum[5] != 50045000 ||
        sum[4] != 50035000 || sum[3] != 50025000 || sum[2] != 50015000 || sum[1] != 50005000 || sum[0] != 49995000) {
        return 1
    }
    return 0
}

func test1(): Int64 {
    var a: Array<Int64> = Array<Int64>(10001) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10001) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10001) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50095009 || sum[8] != 50085008 || sum[7] != 50075007 || sum[6] != 50065006 || sum[5] != 50055005 ||
        sum[4] != 50045004 || sum[3] != 50035003 || sum[2] != 50025002 || sum[1] != 50015001 || sum[0] != 50005000) {
        return 1
    }
    return 0
}

func test2(): Int64 {
    var a: Array<Int64> = Array<Int64>(10002) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10002) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10002) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50105019 || sum[8] != 50095017 || sum[7] != 50085015 || sum[6] != 50075013 || sum[5] != 50065011 ||
        sum[4] != 50055009 || sum[3] != 50045007 || sum[2] != 50035005 || sum[1] != 50025003 || sum[0] != 50015001) {
        return 1
    }
    return 0
}

func test3(): Int64 {
    var a: Array<Int64> = Array<Int64>(10003) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10003) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10003) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50115030 || sum[8] != 50105027 || sum[7] != 50095024 || sum[6] != 50085021 || sum[5] != 50075018 ||
        sum[4] != 50065015 || sum[3] != 50055012 || sum[2] != 50045009 || sum[1] != 50035006 || sum[0] != 50025003) {
        return 1
    }
    return 0
}

func test4(): Int64 {
    var a: Array<Int64> = Array<Int64>(10004) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10004) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10004) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50125042 || sum[8] != 50115038 || sum[7] != 50105034 || sum[6] != 50095030 || sum[5] != 50085026 ||
        sum[4] != 50075022 || sum[3] != 50065018 || sum[2] != 50055014 || sum[1] != 50045010 || sum[0] != 50035006) {
        return 1
    }
    return 0
}

func test5(): Int64 {
    var a: Array<Int64> = Array<Int64>(10005) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10005) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10005) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50135055 || sum[8] != 50125050 || sum[7] != 50115045 || sum[6] != 50105040 || sum[5] != 50095035 ||
        sum[4] != 50085030 || sum[3] != 50075025 || sum[2] != 50065020 || sum[1] != 50055015 || sum[0] != 50045010) {
        return 1
    }
    return 0
}

func test6(): Int64 {
    var a: Array<Int64> = Array<Int64>(10006) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10006) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10006) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50145069 || sum[8] != 50135063 || sum[7] != 50125057 || sum[6] != 50115051 || sum[5] != 50105045 ||
        sum[4] != 50095039 || sum[3] != 50085033 || sum[2] != 50075027 || sum[1] != 50065021 || sum[0] != 50055015) {
        return 1
    }
    return 0
}

func test7(): Int64 {
    var a: Array<Int64> = Array<Int64>(10007) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10007) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10007) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50155084 || sum[8] != 50145077 || sum[7] != 50135070 || sum[6] != 50125063 || sum[5] != 50115056 ||
        sum[4] != 50105049 || sum[3] != 50095042 || sum[2] != 50085035 || sum[1] != 50075028 || sum[0] != 50065021) {
        return 1
    }
    return 0
}

func test8(): Int64 {
    var a: Array<Int64> = Array<Int64>(10008) {i => Int64(2 * i)}
    var b: Array<Int64> = Array<Int64>(10008) {i => Int64(3 * i)}
    var c: Array<Int64> = Array<Int64>(10008) {i => Int64(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int64> = Array<Int64>(outterLoopCnt) {i => Int64(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int64(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 50165100 || sum[8] != 50155092 || sum[7] != 50145084 || sum[6] != 50135076 || sum[5] != 50125068 ||
        sum[4] != 50115060 || sum[3] != 50105052 || sum[2] != 50095044 || sum[1] != 50085036 || sum[0] != 50075028) {
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
