// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#import <Foundation/Foundation.h>

@interface M : NSObject {
@public
  char *objCField;
}
@property(readwrite) char *objCProp;

- (id)init;
- (char *)concatFirst:(const char *)first andSecond:(const char *)second;

@end
