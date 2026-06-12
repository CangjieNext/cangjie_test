/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %lint -f . 2>&1 | compare %f
// ASSERT: scan-not G.VAR.01
func temp<T>(){
    var a =  1
    return a
}
main(){
    { =>
        let c = temp<Int64>()
    }
    return c
}
