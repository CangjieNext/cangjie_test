/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

class Base {
    public func f(): Int32 {
        return 1
    }
    public func get(): Int32 {
        var a = f
        return a()
    }
}

abstract class Base1 {
    public func f(): Int32 {
        return 1
    }
    public func get(): Int32 {
        var a = f
        return a()
    }
}

public class Base2 {
    public func f(): Int32 {
        return 1
    }
    public func get(): Int32 {
        var a = f
        return a()
    }
}

class Base3 {
    public func f(): Int32 {
        return 1
    }
    public func get(): Int32 {
        var a = f
        return a()
    }
}

main(): Int64 {
    return Int64(Base().get() + Base2().get() + Base3().get() - 3)
}
