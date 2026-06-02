/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



let str: String 

func run(): Int64 {
str = "Hello Char Lang"
print("StringTest: " + str)
return 0
}

main(): Int64 {
return run()
}
// ASSERT: scan parse_var_must_be_initialized
