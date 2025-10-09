// LEVEL: 2
// EXEC-PIPE: %lint -f . 2>&1 | compare %f
// ASSERT: scan-not G.VAR.01
class A<T> {
    var temp = 1
    mut prop a :Int64{
        get(){
            temp
        }
        set(v){
            temp = v
        }
    }
    { =>
        var test = A()
        test.a = 2
    }
}
main() {
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
