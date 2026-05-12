/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [A E1];
        printf("in oc, %s\n", [a fB]?"true":"false");
        printf("in oc, %u\n", [a fu8]);
        printf("in oc, %hu\n", [a fu16]);
        printf("in oc, %u\n", [a fu32]);
        printf("in oc, %llu\n", [a fu64]);
        printf("in oc, %zu\n", [a fuN]);
        printf("in oc, %f\n", [a ff32]);
        printf("in oc, %f\n", [a ff64]);

        printf("in oc implicit, %s\n", [a implicitB]?"true":"false");
        printf("in oc implicit, %u\n", [a implicitu8]);
        printf("in oc implicit, %hu\n", [a implicitu16]);
        printf("in oc implicit, %u\n", [a implicitu32]);
        printf("in oc implicit, %llu\n", [a implicitu64]);
        printf("in oc implicit, %zu\n", [a implicituN]);
        printf("in oc implicit, %f\n", [a implicitf32]);
        printf("in oc implicit, %f\n", [a implicitf64]);

        printf("in oc st, %s\n", [A stfB]?"true":"false");
        printf("in oc st, %u\n", [A stfu8]);
        printf("in oc st, %hu\n", [A stfu16]);
        printf("in oc st, %u\n", [A stfu32]);
        printf("in oc st, %llu\n", [A stfu64]);
        printf("in oc st, %zu\n", [A stfuN]);
        printf("in oc st, %f\n", [A stff32]);
        printf("in oc st, %f\n", [A stff64]);
    }
    return 0;
}
