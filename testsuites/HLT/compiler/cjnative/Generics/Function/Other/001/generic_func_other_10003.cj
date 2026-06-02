/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



class A{
    public mut prop a : Int64{
        get<T>(){1}
        set<T>(i){}
    }
}



main(){
    A()
    0
}
// ASSERT: scan parse_getter_setter_cannot_be_generic
