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
    return 0
}

class Data{
    public Data(var x:Int64){
        this.x = x
    }
    public func foo():This{
        if( this.n != 1) {
            return this
        }
        this.m = 10
        if( this.m != 2) {
            return this
        }
    }
}

extend This {
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
// ASSERT: scan parse_this_type_not_allow
