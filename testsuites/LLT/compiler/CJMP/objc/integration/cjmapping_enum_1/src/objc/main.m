/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "TimeUnit.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        printf("Case 1:\n");
	[[TimeUnit Month] CalcMonth];
	[[TimeUnit Year] CalcMonth];
	[[TimeUnit Month:36] CalcMonth];
	[[TimeUnit Year:2] CalcMonth];
	[[TimeUnit TenYear] CalcMonth];
	printf("%lld\n",[[TimeUnit TenYear] item]);
	[[[TimeUnit TenYear] toMonth] CalcMonth];
	printf("%lld\n", [TimeUnit KindOfTime: [[TimeUnit Year:2] toMonth]]);
   }
    return 0;
}
