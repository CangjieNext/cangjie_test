/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %compile_lib_opt %f

class Base {
    public static func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        match (f()) {
            case _ => 5
        }
        return 1
    }

    private static func get(a: Int64): Int32 {
        match (f()) {
            case _ => 5
        }
        return 1
    }

    protected static func get(a: Int64, b: Bool): Int32 {
        match (f()) {
            case _ => 5
        }
        return 1
    }

    public static func get(
        a: Int64,
        b: Bool,
        c: Int64,
        d!: Bool = {
            =>
            f();
            true
        }()
    ): Int32 {
        match (f()) {
            case _ => 5
        }
        return 1
    }
}
