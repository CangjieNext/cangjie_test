/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



var aa = 0

class Data<T>{
    public Data(var a!: Int64 = 6){
        aa++
    }

    public func f1(a: T): This{
        func f2() : This { 
            this
        }

        func f2(c: This) { 
            
        }
        f2()
    }
}

main():Int64{
    var data = Data<Int64>(a: 8)
    if (data.f1(3).a == 8 && aa == 1) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_this_type_not_allow
