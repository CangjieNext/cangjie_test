/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expected declaration, found ''

/* 不带括号的宏调用，其参数必须是以下声明或表达式中的一种:
    函数声明, struct 声明, enum 声明, enum constructor, 类声明, 静态初始化器, class 和 struct 构造函数和主构造函数
    类终结器, 接口声明, 变量声明, 属性声明, 扩展声明, 宏调用表达式
*/

main() {
    @C 
    "123"

    0
}
