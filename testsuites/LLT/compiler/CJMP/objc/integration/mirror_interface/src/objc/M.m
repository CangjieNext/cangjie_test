// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M.h"
#import "M1.h"

@implementation M

static int64_t _m1Counter = 0;
static id _sIdProp;
static id<ProtoM1> _sProtoProp;

+ (void)initialize {
    _sIdProp = [[M alloc] init];
    _sProtoProp = [[M1 alloc] initWithValue: _m1Counter++];
}

- (id)init {
    if (self = [super init]) {
        printf("objc: [M init]\n");
        self->idField = [[M1 alloc] initWithValue: _m1Counter++];
        self->protoField = [[M1 alloc] initWithValue: _m1Counter++];
    }

    return self;
}

+(id)sIdProp {
    printf("objc: [M sIdProp]\n");
    return _sIdProp;
}

+(void)setSIdProp:(id)value {
    printf("objc: [M setSIdProp:]\n");
    _sIdProp = value;
}

+(id<ProtoM1>)sProtoProp {
    printf("objc: [M sProtoProp]\n");
    return _sProtoProp;
}

+(void)setSProtoProp:(id<ProtoM1>)value {
    printf("objc: [M setSProtoProp:]\n");
    _sProtoProp = value;
}

-(id)idProp {
    printf("objc: [M idProp]\n");
    return self->idField;
}

-(void)setIdProp:(id)value {
    printf("objc: [M setIdProp:]\n");
    self->idField = value;
}

-(id<ProtoM1>)protoProp {
    printf("objc: [M protoProp]\n");
    return self->protoField;
}

-(void)setProtoProp:(id<ProtoM1>)value {
    printf("objc: [M setProtoProp:]\n");
    self->protoField = value;
}

+(id)booRetObjCIdWithArg0: (id)arg0 {
    printf("objc: [M booRetObjCIdWithArg0:]\n");
    return arg0;
}

+(id<ProtoM1>)booRetProtoM1WithArg0: (id<ProtoM1>)arg0 {
    printf("objc: [M booRetProtoM1WithArg0:]\n");
    printf("objc: Now I will send [arg0 identity]\n");
    [arg0 identity];
    return arg0;
}

-(id) fooRetObjCIdWithArg0: (id)arg0 {
    printf("objc: [M fooRetObjCIdWithArg0:]\n");
    return arg0;
}
-(id<ProtoM1>) fooRetProtoM1WithArg0: (id<ProtoM1>)arg0 {
    printf("objc: [M fooRetProtoM1WithArg0:]\n");
    printf("objc: Now I will send [arg0 identity]\n");
    [arg0 identity];
    return arg0;
}

+ (id) booRetObjCIdWithArg0: (id)arg0 andArg1: (id<ProtoM1>) arg1 {
    printf("objc: [M booRetObjCIdWithArg0:andArg1:]\n");
    printf("objc: Now I will call [arg1 identity]\n");
    [arg1 identity];
    return arg0;
}
+ (id<ProtoM1>) booRetProtoM1WithArg0: (id<ProtoM1>)arg0 andArg1: (id) arg1 {
    printf("objc: [M booRetProtoM1WithArg0:andArg1:]\n");
    printf("objc: Now I will call [arg0 identity]\n");
    [arg0 identity];
    return arg1;
}

- (id) fooRetObjCIdWithArg0: (id)arg0 andArg1: (id<ProtoM1>) arg1 {
    printf("objc: [M fooRetObjCIdWithArg0:andArg1:]\n");
    printf("objc: Now I will call [arg1 identity]\n");
    [arg1 identity];
    return arg0;
}
- (id<ProtoM1>) fooRetProtoM1WithArg0: (id<ProtoM1>)arg0 andArg1: (id) arg1 {
    printf("objc: [M fooRetProtoM1WithArg0:andArg1:]\n");
    printf("objc: Now I will call [arg0 identity]\n");
    [arg0 identity];
    return arg0;
}

- (void) identity {
    printf("objc: I'm a class M instance\n");
}

@end
