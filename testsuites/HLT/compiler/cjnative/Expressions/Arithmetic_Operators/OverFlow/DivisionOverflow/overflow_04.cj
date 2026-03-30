/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// RUN-EXEC: %run %run_opt %output %run_args

func test(){
    try {
    let w = 1.0 / 1e308
    print("w=" + w.toString() + "\n")
    }catch(e:Exception){
        println("caught exception:")
        print(e)
    }finally{
        print("done")
    }
}



main(): Int64 {
    test()
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
