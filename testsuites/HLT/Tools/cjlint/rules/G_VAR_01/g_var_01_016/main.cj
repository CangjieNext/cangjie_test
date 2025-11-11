/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %lint -f ./ 2>&1 | compare %f
// ASSERT: scan G.VAR.01: Prefer not to declare it as mutable and avoid defining a setter function for an unchanging property 'a'.

struct A{
    mut prop a :Int64 {
        get(){
            0
        }
        set(v){}
    }
}

main(){
    return 0
}
