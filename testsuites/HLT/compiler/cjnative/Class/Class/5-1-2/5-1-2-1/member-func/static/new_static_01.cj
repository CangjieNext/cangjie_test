/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %compile_lib_opt %f 2>&1 | compare %f

class Base {
    public func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        var a = f
        return 0
    }
}

abstract class Base1 {
    public func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        var a = f
        return 0
    }
}

public class Base2 {
    public func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        var a = f
        return 0
    }
}

class Base3 {
    public func f(): Int32 {
        return 1
    }
    public static func get(): Int32 {
        var a = f
        return 0
    }
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
