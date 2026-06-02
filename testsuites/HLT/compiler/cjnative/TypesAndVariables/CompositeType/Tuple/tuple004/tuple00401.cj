/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-1: %compiler %cmp_opt %f -o %output
// Deprecated ?:
func foo_tuple(): Int64{
var tp1: Float32*Rune = (3.14, 'P')
var tp2: Rune*Rune = ('3', 'P')
var res1 = true ? tp1 : ('3', 'P')
var res2 = false ? (3.14, 'P') : tp2
if (tp1._0 == 3.14 && tp2._0 == '3') {
return 0
}
return 1
}

main():Int64{
return foo_tuple()
}
