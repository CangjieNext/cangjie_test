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

func test0(): Int32 {
    var a: Array<Int32> = Array<Int32>(100000) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100000) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100000) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 705882704 || sum[8] != 705782704 || sum[7] != 705682704 || sum[6] != 705582704 || sum[5] != 705482704 ||
        sum[4] != 705382704 || sum[3] != 705282704 || sum[2] != 705182704 || sum[1] != 705082704 || sum[0] != 704982704) {
        return 1
    }
    return 0
}

func test1(): Int32 {
    var a: Array<Int32> = Array<Int32>(100001) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100001) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100001) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 705982713 || sum[8] != 705882712 || sum[7] != 705782711 || sum[6] != 705682710 || sum[5] != 705582709 ||
        sum[4] != 705482708 || sum[3] != 705382707 || sum[2] != 705282706 || sum[1] != 705182705 || sum[0] != 705082704) {
        return 1
    }
    return 0
}

func test2(): Int32 {
    var a: Array<Int32> = Array<Int32>(100002) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100002) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100002) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706082723 || sum[8] != 705982721 || sum[7] != 705882719 || sum[6] != 705782717 || sum[5] != 705682715 ||
        sum[4] != 705582713 || sum[3] != 705482711 || sum[2] != 705382709 || sum[1] != 705282707 || sum[0] != 705182705) {
        return 1
    }
    return 0
}

func test3(): Int32 {
    var a: Array<Int32> = Array<Int32>(100003) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100003) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100003) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706182734 || sum[8] != 706082731 || sum[7] != 705982728 || sum[6] != 705882725 || sum[5] != 705782722 ||
        sum[4] != 705682719 || sum[3] != 705582716 || sum[2] != 705482713 || sum[1] != 705382710 || sum[0] != 705282707) {
        return 1
    }
    return 0
}

func test4(): Int32 {
    var a: Array<Int32> = Array<Int32>(100004) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100004) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100004) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706282746 || sum[8] != 706182742 || sum[7] != 706082738 || sum[6] != 705982734 || sum[5] != 705882730 ||
        sum[4] != 705782726 || sum[3] != 705682722 || sum[2] != 705582718 || sum[1] != 705482714 || sum[0] != 705382710) {
        return 1
    }
    return 0
}

func test5(): Int32 {
    var a: Array<Int32> = Array<Int32>(100005) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100005) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100005) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706382759 || sum[8] != 706282754 || sum[7] != 706182749 || sum[6] != 706082744 || sum[5] != 705982739 ||
        sum[4] != 705882734 || sum[3] != 705782729 || sum[2] != 705682724 || sum[1] != 705582719 || sum[0] != 705482714) {
        return 1
    }
    return 0
}

func test6(): Int32 {
    var a: Array<Int32> = Array<Int32>(100006) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100006) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100006) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706482773 || sum[8] != 706382767 || sum[7] != 706282761 || sum[6] != 706182755 || sum[5] != 706082749 ||
        sum[4] != 705982743 || sum[3] != 705882737 || sum[2] != 705782731 || sum[1] != 705682725 || sum[0] != 705582719) {
        return 1
    }
    return 0
}

func test7(): Int32 {
    var a: Array<Int32> = Array<Int32>(100007) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100007) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100007) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706582788 || sum[8] != 706482781 || sum[7] != 706382774 || sum[6] != 706282767 || sum[5] != 706182760 ||
        sum[4] != 706082753 || sum[3] != 705982746 || sum[2] != 705882739 || sum[1] != 705782732 || sum[0] != 705682725) {
        return 1
    }
    return 0
}

func test8(): Int32 {
    var a: Array<Int32> = Array<Int32>(100008) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(100008) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(100008) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    println("====")
    if (sum[9] != 706682804 || sum[8] != 706582796 || sum[7] != 706482788 || sum[6] != 706382780 || sum[5] != 706282772 ||
        sum[4] != 706182764 || sum[3] != 706082756 || sum[2] != 705982748 || sum[1] != 705882740 || sum[0] != 705782732) {
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
