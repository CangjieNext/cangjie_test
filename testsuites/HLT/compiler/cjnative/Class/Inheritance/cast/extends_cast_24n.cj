/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main(): Int64 {
var obj1 : Base = Data()
var obj2 = obj1.Nest() 
return 0
}

open class Base {
class Nest {
}
}

class Data <: Base {
}
// ASSERT: scan parse_unexpected_declaration_in_scope
