// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "A.h"
#import "M.h"
#import <Foundation/Foundation.h>

static void describe(const char* what, M* obj) {
    printf("objc: %s -> %s\n", what, [[obj description] UTF8String]);
}

int main(int argc, char **argv) {
    @autoreleasepool {
        // The Cangjie side keeps no reference: the peer we get back is the only thing holding the instance.
        M* obj = [A createObject];
        describe("after createObject", obj);

        [A collectGarbage];
        describe("after collectGarbage", obj);

        // Escaping through an Objective-C container, with the local reference dropped in between.
        NSMutableArray* box = [NSMutableArray arrayWithObject:obj];
        obj = nil;
        [A collectGarbage];
        obj = [box objectAtIndex:0];
        describe("after round trip through NSMutableArray", obj);

        // And back into Cangjie: it must arrive as the same instance, Cangjie state and all.
        [A acceptObject:obj];
        describe("after acceptObject", obj);
    }

    return 0;
}
