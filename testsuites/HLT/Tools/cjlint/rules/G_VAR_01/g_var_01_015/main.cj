// LEVEL: 2
// EXEC-PIPE: %lint -f ./ 2>&1 | compare %f
// ASSERT: scan-1 G.VAR.01

struct A{
    var test = 1
    private mut prop a: Int64{
        get(){
            test
        }
        set(v){
            test = v
        }
    }
}
main(){
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
