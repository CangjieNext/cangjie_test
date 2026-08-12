/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

typedef int Int;
typedef Int Int1;

typedef void(*Func)();
typedef Func *PFunc;

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

struct CStruct {
};

@interface M : BaseClass <BaseProtocol> {
    int x;
    Int1 i;
    PFunc* pf;
    enum Enum e;
    C* c;
    id<P> p;
    struct CStruct* c_struct;
}
@end
