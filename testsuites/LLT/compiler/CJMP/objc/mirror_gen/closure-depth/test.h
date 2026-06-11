/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

typedef int Int;
typedef Int Int1;

typedef float Float;
typedef Float Float1;

enum Enum : int { a };

@interface BaseClass
@end

@interface BaseC
@end

@interface C
-(BaseC*)foo;
@end

@protocol BaseProtocol
@end

@protocol P
@end

@interface M : BaseClass <BaseProtocol> {
    int x;
    Int1 i;
    Float1* pf;
    enum Enum e;
    C* c;
    id<P> p;
}
@end
