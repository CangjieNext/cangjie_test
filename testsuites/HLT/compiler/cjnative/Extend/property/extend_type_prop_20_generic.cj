/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() : Int64 {
    var a:Int8 = 1
    if( a.n != 1) {
        return 1
    }
    a.m = 10
    if( a.m != 2) {
        return 2
    }
    return 0
}

class A<T>{}
extend (A<T>)  { 
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan parse_unexpected_type_in
