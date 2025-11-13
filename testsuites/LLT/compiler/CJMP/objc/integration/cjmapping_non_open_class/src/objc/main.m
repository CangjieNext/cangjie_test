/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"

int main(int argc, char** argv) {
	@autoreleasepool {
		printf("in oc main, creates instance impl in Cangjie!\n");
		A* a1 = [[A alloc] init];
		int64_t r0 = [a1 foo:1];
		int64_t r1 = [a1 foo:2 :3];
		printf("in oc main, ObjC call cangjie instance func: r0: %lld, r1: %lld!\n", r0, r1);

		int64_t r2 = [A sfoo: 1];
		int64_t r3 = [A sfoo: 2 :3];
		printf("in oc main, ObjC call cangjie static func: r2: %lld, r3: %lld!", r2, r3);
		
		A* a2 = [[A alloc] init: 1];
		[a2 fooParamA: [a2 fooRetA: 2]];

		B* b = [[B alloc] init];
		[a2 fooParamB: [a2 fooRetB: 3]];
	}
	return 0;
}