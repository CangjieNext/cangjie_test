/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var b = Boo()
    if (b.m != 1) {
        return 1
    }
    if (b.n != 2) {
        return 2
    }
    b.m = 3
    if (b.m != 1) {
        return 3
    }
    if (b.n != 2) {
        return 4
    }
    return 0
}

class Boo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public mut prop m: Int64 {
        get() {
            1 // retrun 1
        }
        set(input) {
            () // return ()
        }
    }
    public prop n: Int32 {
        get() {
            return 2
        }
    }
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public mut prop m: Int64 {
        get() {
            if (false) {
                return 0
            } else {
                return 1
            }
        }
        set(input) {
            func set() {}
        }
    }
    public prop n: Int32 {
        get() {
            return 2
        }
    }
}

extend Coo {
    public func set() {}
}
