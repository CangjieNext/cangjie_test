/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



struct R<T>{
    public operator func test (inputB:R<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

class C<T>{
    public operator func test (inputB:C<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

interface I<T>{
    operator func test (inputB:I<T>):Bool{ // EXPECT: scan illegal operator 'test' for overloading
        return true
    }
}

main():Int64{
    return 1
}
// ASSERT: scan parse_invalid_overloaded_operator
