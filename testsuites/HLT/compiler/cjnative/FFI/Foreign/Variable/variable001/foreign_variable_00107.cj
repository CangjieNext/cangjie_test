/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output



foreign class A{
foreign let a = 1 
}

foreign interface B{
foreign let a = 1 
}

foreign {
class C{
foreign let a = 1 
}

interface D{
foreign let a = 1 
}
}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_unexpected_declaration_in_scope
