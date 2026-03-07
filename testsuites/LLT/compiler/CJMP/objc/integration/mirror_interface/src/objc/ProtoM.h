// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "ProtoM1.h"

@protocol ProtoM

@property id idProp;
@property id<ProtoM1> protoProp;

@property (class) id sIdProp;
@property (class) id<ProtoM1> sProtoProp;

+(id)booRetObjCIdWithArg0: (id)arg0;
+(id<ProtoM1>)booRetProtoMWithArg0: (id<ProtoM1>)arg0;

-(id)fooRetObjCIdWithArg0: (id)arg0;
-(id<ProtoM1>)fooRetProtoMWithArg0: (id<ProtoM1>)arg0;

@end