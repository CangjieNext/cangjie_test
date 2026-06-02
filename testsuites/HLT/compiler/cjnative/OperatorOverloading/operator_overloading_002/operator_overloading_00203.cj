/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct R{
    public let r : Array<Int32>
    public operator func [(inputB:Int32):Int32{ 
        return inputA.r[Int64(inputB)]
    }
    public operator func [(inputB:Int64):Int32{ 
        return inputA.r[inputB]
    }
    public operator func [(inputB:R):Bool{ 
        return true
    }
}

class C{
    public let c : Array<Int32>
    public operator func [(inputB:Int32):Int32{ 
        return inputA.c[Int64(inputB)]
    }
    public operator func [(inputB:Int64):Int32{ 
        return inputA.c[inputB]
    }
    public operator func [(inputB:C):Bool{ 
        return true
    }
}


interface I{
    let i : Array<Int32> = [0,1,2,3]
    operator func [(inputB:Int32):Int32{ 
        return I.i[Int64(inputB)]
    }
    operator func [(inputB:Int64):Int32{ 
        return I.i[inputB]
    }
    operator func [(inputB:I):Bool{ 
        return true
    }
}

class A <: I{}

main():Int64{
    return 1
}
// ASSERT: scan parse_invalid_overloaded_operator
// ASSERT: scan parse_unexpected_declaration_in_scope
