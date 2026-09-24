/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A {
    int a1;
    int a2;
}
@property (class) int a1;
@property int a1;
@property int a3;
@end

@interface M : A {
    int a3;
    int m;
}
@property (class) int a1;
@property int a1;
@property int a2;
@property (class) int m;
@property int m;
@end
