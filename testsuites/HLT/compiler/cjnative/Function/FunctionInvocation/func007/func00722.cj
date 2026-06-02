/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f

func test(a!:Int64 = 1,b!:Int64 = 1,c:Int64){return 0}

main(): Int64 {
    return test(0)
}
// ASSERT: scan parse_named_parameter_after_unnamed
