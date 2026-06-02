/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
1
2
3
 */

class RHS {
    private var mGlobal: Int32 = 1
    private static var mStatic: Int32 = 2
    private var mVolatile: Int32 = 3

    public static var GLOBAL: Int32 = 1
    public static var STATIC: Int32 = 2
    public static var VOLATILE: Int32 = 3

    public RHS() {
    }

    public func getMember(type1: Int32): Int32 {
        var retVal: Int32 = 0
        if (type1 == STATIC) {
            retVal = mStatic
        } else if (type1 == VOLATILE) {
            retVal = mVolatile
        } else if (type1 == GLOBAL) {
            retVal = mGlobal
        } else {
            retVal = mGlobal
        }
        return retVal
    }
}

main(): Int64 {
    var rhs: RHS = RHS()
    print(rhs.getMember(RHS.GLOBAL).toString() + "\n")
    print(rhs.getMember(RHS.STATIC).toString() + "\n")
    print(rhs.getMember(RHS.VOLATILE).toString() + "\n")
    return 0
}
