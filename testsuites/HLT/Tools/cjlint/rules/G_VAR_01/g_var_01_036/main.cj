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
enum A<T> {
    | E
    func test() {
        var temp = 1
        private mut prop a : Int64{
            get(){
                temp
            }
            set(v){
                temp = v
            }
        }
        
        init(){
            let b = temp1
        }
        func temp1(){
            a = 2
            return 1
        }
    }
}

main(): Int64 {
    0
}
