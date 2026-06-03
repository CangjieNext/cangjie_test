//
//  main.m
//  test_cangjie_ios_175
//
//  Created by cjtest on 2026/5/30.
//

#import <Foundation/Foundation.h>
#import "bridge_cangjie/bridge_cangjie.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NSString *workspaceValue = nil;
        for (int i = 1; i < argc; i++) {
            NSString *arg = [NSString stringWithUTF8String:argv[i]];
            if ([arg isEqualToString:@"--workspace"]) {
                if (i + 1 < argc) {
                    workspaceValue = [NSString stringWithUTF8String:argv[i + 1]];
                    if (chdir([workspaceValue UTF8String]) != 0) {
                        printf("Error: Failed to chdir to %s\n", [workspaceValue UTF8String]);
                    }
                    break;
                } else {
                    printf("option '--workspace' lacking value.\n");
                    return 255;
                }
            }
        }
    }
    return run_cangjie();
}
