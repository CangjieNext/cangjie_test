/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface NSArray <__covariant ObjectType>
@end

@interface M<ObjectType> : NSArray<ObjectType>
-(void)f1:(ObjectType)x;
-(void)f2:(NSArray<ObjectType>*)x;
-(void)f3:(NSArray<NSArray<ObjectType>*>*)x;
-(void)f4:(NSArray*)x;
@end
