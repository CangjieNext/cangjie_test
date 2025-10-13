/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct R {
    public operator func -(): Int32 {
        return 1
    }
    //    operator func ++():Int32{ 
    //    }
    //    operator func --():Int32{ 
    //    }
    public operator func !(): Int32 {
        return 1
    }
}

class C {
    public operator func -(): Int32 {
        return 1
    }
    //    operator func ++():Int32{ 
    //    }
    //    operator func --():Int32{ 
    //    }
    public operator func !(): Int32 {
        return 1
    }
}

interface I {
    operator func -(): Int32 {
        return 1
    }
    //    operator func ++():Int32{ 
    //    }
    //    operator func --():Int32{ 
    //    }
    operator func !(): Int32 {
        return 1
    }
}

class A <: I {}

main(): Int64 {
    var a: I = A()
    var c = C()
    var r = R()
    return 0
}
