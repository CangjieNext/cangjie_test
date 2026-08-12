/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

void (*foo())(int x);
void (^bar())(int x);

@interface M
- (void (*)(int x))foo;
- (void (^)(int x))bar;
@end
