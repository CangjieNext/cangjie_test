/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


main():Int64 {
    return 0
}

class Aoo{
    public var a: Int32 = 1
    public let b: Int32 = 2
    public var c = if(true){
        mut prop poo2:Int32{
            get(){
                var x = a+b;return x
            }
            set(v){
                var x = a+b
            }
        }
    }
}
// ASSERT: scan parse_unexpected_declaration_in_scope
