/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

typedef int uint32_t;
typedef long int_fast32_t;
typedef int size_t;

typedef int UserDefinedImportantTypeDef;

enum E : uint32_t;
enum EE : int;
enum EEE {
 A, B, C
};

@interface M
-(void)foo: (uint32_t)x with:(enum E)y;
-(void)bar: (int_fast32_t)x with:(enum EE)y;
-(void)baz: (size_t)x with:(enum EEE)y;
-(void)foobarbaz: (UserDefinedImportantTypeDef)x;
@end