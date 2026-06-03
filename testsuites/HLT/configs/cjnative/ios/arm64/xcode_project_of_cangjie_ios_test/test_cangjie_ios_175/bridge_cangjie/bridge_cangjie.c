//
//  bridge_cangjie.c
//  test_cangjie_ios_175
//
//  Created by cjtest on 2026/5/30.
//

#include "bridge_cangjie.h"
#include "Cangjie.h"
#include "unistd.h"
#include <stdio.h>

void cangjie_main(void);

int run_cangjie(void) {
    struct RuntimeParam param = {
        .heapParam = {
            .regionSize = 64UL,
            .heapSize = 256 * 1024,
            .exemptionThreshold = 0.8,
            .heapUtilization = 0.6,
            .heapGrowth = 0.15,
            .allocationRate = 10240,
            .allocationWaitTime = 1000
        },
            .gcParam = {
                .gcThreshold = 20480,
                .garbageThreshold = 0.5,
                .gcInterval = 150,
                .backupGCInterval = 240,
                .gcThreads = 8
            },
            .logParam = {
                .logLevel = RTLOG_ERROR
            },
            .coParam = {
                .thStackSize = 64 * 1024,
                .coStackSize = 64 * 1024,
                .processorNum = 8
            }
    };
    enum RTErrorCode rtErrorCode = InitCJRuntime(&param);
    if (rtErrorCode != E_OK) {
        printf("Failed to InitCJRuntime, RTErrorCode = %d.\n", rtErrorCode);
    }
    // rtErrorCode = InitCJLibrary("test_cangjie_ios_175");
    if (rtErrorCode != E_OK) {
        printf("Failed to InitCJLibrary, RTErrorCode = %d.\n", rtErrorCode);
    }
    CJThreadHandle cjThreadHandle = RunCJTask((CJTaskFunc)cangjie_main, NULL);
    if (cjThreadHandle == NULL) {
        printf("Failed to RunCJTask.\n");
    } else {
        void*ret;
        rtErrorCode = GetTaskRetWithTimeout(cjThreadHandle, &ret, (int64_t)1000 * 1000 * 1000 * 1000);
        if (rtErrorCode != E_OK) {
            printf("Failed to GetTaskRetWithTimeout, RTErrorCode = %d.\n", rtErrorCode);
        }
    }
    rtErrorCode = FiniCJRuntime();
    if (rtErrorCode != E_OK) {
        printf("Failed to FiniCJRuntime, RTErrorCode = %d.\n", rtErrorCode);
    }
    ReleaseHandle(cjThreadHandle);
    
    return rtErrorCode;
}
