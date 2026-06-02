/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f




func run(): Int64 {
    struct Test{
        let width: Int32 = 2
        let length: Int32 = 5
        func area(): Int32 {
            return width * length
        }
    }

    let test = Test().area()

    if(test == 10){
          return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
