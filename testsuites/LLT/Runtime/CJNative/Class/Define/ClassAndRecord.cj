// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Cls0 {
    public var i0: Int32 = 0
    public func COF0(): Int32 {
        return i0
    }
}

struct Rcd0 {
    public var i1: Int64 = 1
    public func R0F0(a: Int32): Int32 {
        return a + 1
    }
}

struct Rcd1 {
    public var c0: Cls0 = Cls0()
    public var i2: Int32 = 2
    public func R1F0(): Int32 {
        return 2
    }
}

class Cls1 {
    public var r0: Rcd0 = Rcd0()
    public var i3: Int32 = 3
    public func C1F0(a: Int32): Int32 {
        return a + i3
    }
}

struct Rcd2 {
    public var r1: Rcd1 = Rcd1()
    public var c1: Cls1 = Cls1()
    public var i4: Int64 = 4
    public var i5: Int32 = 5
    public func R2F0(): Int32 {
        return 4
    }
    public func R2F1(): Int32 {
        return 5
    }
}

class Cls2 {
    public var i6: Int64 = 6
    public var r2: Rcd2 = Rcd2()
    public var i7: Int32 = 7
    public func C2F0(): Int64 {
        return i6 - 6
    }
}

func RecordRun() {
    var t: Rcd2 = Rcd2()
    t.r1.c0.i0 = t.R2F0()
    var r1Temp: Rcd1 = Rcd1()
    r1Temp.i2 = 3
    t.r1 = r1Temp
    t.c1.i3 = t.c1.r0.R0F0(2)
}

func ClassRun() {
    var t: Cls2 = Cls2()
    t.r2.r1.c0.i0 = t.r2.R2F0()
    var r1Temp: Rcd1 = Rcd1()
    r1Temp.i2 = 3
    t.r2.r1 = r1Temp
    t.r2.c1.i3 = t.r2.c1.r0.R0F0(3)
    print((t.C2F0()).toString())
    return t.C2F0()
}

main(): Int64 {
    RecordRun()
    return ClassRun()
}
