// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import "ProtoM.h"

@interface M : NSObject<ProtoM>
{
    @public
    id idField;
    id<ProtoM1> protoField;
}

+(id)booRetObjCIdWithArg0: (id)arg0;
+(id<ProtoM1>)booRetProtoM1WithArg0: (id<ProtoM1>)arg0;

-(id) fooRetObjCIdWithArg0: (id)arg0;
-(id<ProtoM1>) fooRetProtoM1WithArg0: (id<ProtoM1>)arg0;

- (id)init;

+ (id) booRetObjCIdWithArg0: (id)arg0 andArg1: (id<ProtoM1>) arg1;
+ (id<ProtoM1>) booRetProtoM1WithArg0: (id<ProtoM1>)arg0 andArg1: (id) arg1;

- (id) fooRetObjCIdWithArg0: (id)arg0 andArg1: (id<ProtoM1>) arg1;
- (id<ProtoM1>) fooRetProtoM1WithArg0: (id<ProtoM1>)arg0 andArg1: (id) arg1;

@end
