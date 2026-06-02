/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var count = 0

@C
struct teststruct1 {
    public var cstr1: CString
    public var cstr2: CString

    public init(cstr1: CString, cstr2: CString) {
        this.cstr1 = cstr1
        this.cstr2 = cstr2
    }
}

struct teststruct2 {
    public var cstr1: CString
    public var cstr2: CString

    public init(cstr1: CString, cstr2: CString) {
        this.cstr1 = cstr1
        this.cstr2 = cstr2
    }
}

class TESTCLASS {
    public var cstr1: CString
    public var cstr2: CString

    public init(cstr1: CString, cstr2: CString) {
        this.cstr1 = cstr1
        this.cstr2 = cstr2
    }
}

unsafe main() {
    var ts1 = teststruct1(unsafe { LibC.mallocCString("abc") }, unsafe { LibC.mallocCString("efg") })
    var ts2 = teststruct1(unsafe { LibC.mallocCString("abc") }, unsafe { LibC.mallocCString("efg") })
    var tc = TESTCLASS(unsafe { LibC.mallocCString("abc") }, unsafe { LibC.mallocCString("efg") })

    if (ts1.cstr1.equals(ts2.cstr1) && ts2.cstr2.equals(tc.cstr2)) {
        count += 1
    }

    LibC.free(ts1.cstr1)
    LibC.free(ts1.cstr2)
    LibC.free(ts2.cstr1)
    LibC.free(ts2.cstr2)
    LibC.free(tc.cstr1)
    LibC.free(tc.cstr2)

    if (count == 1) {
        return 0
    } else {
        return 1
    }
}
