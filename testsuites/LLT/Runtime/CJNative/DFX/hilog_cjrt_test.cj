// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Android) EXEC: %compiler %cmp_opt %f -o %output
// (Android) RUN-EXEC: logcat -c && export MRT_LOG_LEVEL=i && %run %run_opt %output && timeout 2s logcat | grep Cangjie | compare %f
// (Android) ASSERT: scan I CANGJIE-RUNTIME: Cangjie runtime started.
// (Android) ASSERT: scan I CANGJIE-RUNTIME: Cangjie runtime shutdown.
// (iOS) EXEC: %compiler %cmp_opt %f -o %output
// (iOS) RUN-EXEC: %run %run_opt %output
// (iOS) EXEC: timeout 8s xcrun simctl spawn ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} log stream --style syslog --level info > ios_sim.log & sleep 0.5s && SIMCTL_CHILD_MRT_LOG_LEVEL=i xcrun simctl launch --console-pty --terminate-running-process ${XCODE_DEVICE_UDID_OF_CANGJIE_IOS_TEST} ${XCODE_BUNDLE_ID_OF_CANGJIE_IOS_TEST}
// (iOS) EXEC: cat ios_sim.log | grep Cangjie | compare %f
// (iOS) ASSERT: scan I Cangjie runtime started.
// (iOS) ASSERT: scan I Cangjie runtime shutdown.

main() {}
