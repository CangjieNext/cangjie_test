#import <Foundation/Foundation.h>

// 1. 伪造苹果 CoreFoundation 的指针类型
typedef const void * CFTypeRef;

// 2. 拦截 CFGetRetainCount 调用，将其桥接到 GNUstep 原生支持的 retainCount 方法上
static inline long CFGetRetainCount(CFTypeRef cf) {
    return [(id)cf retainCount]; 
}