/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import "A.h"
#import "AA.h"
#import "BB.h"

int main(int argc, char** argv) {
	@autoreleasepool {
		printf("in oc main, creates override instance in Cangjie!\n");
		A* a1 = [[AA alloc] init];
		[a1 sayHello];
		int64_t r0 = [a1 foo:1];
		int64_t r1 = [a1 foo:2 :3];
		printf("in oc main, ObjC call cangjie instance func: r0: %lld, r1: %lld!\n", r0, r1);

		int64_t r2 = [A sfoo: 1];
		int64_t r3 = [A sfoo: 2 :3];
		printf("in oc main, ObjC call cangjie static func: r2: %lld, r3: %lld!\n", r2, r3);

		BB* b = [[BB alloc] init];
		[b hello];

		B* retB = [a1 fooRetB:1];
		printf("in oc main, got B(non-open) as a result of fooRetB\n");
		int64_t r4 = [a1 fooParamB:retB];
		printf("in oc main, when this retB is used as param for fooParamB the result is %lld\n", r4);

		B* sretB = [A sfooRetB:2];
		printf("in oc main, got B(non-open) as a result of sfooRetB\n");
		int64_t r5 = [A sfooParamB:retB];
		printf("in oc main, when this sretB is used as param for sfooParamB the result is %lld\n", r5);
	}
	return 0;
}
