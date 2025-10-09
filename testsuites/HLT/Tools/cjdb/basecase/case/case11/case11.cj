/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class test_C4<X,Y> {

    public test_C4(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in main init method.\n")
    }
}

main(){
        let class_004 = test_C4<Bool,String>(1, true, v:2, z:"你好，cangjie。")
        return 0
}
