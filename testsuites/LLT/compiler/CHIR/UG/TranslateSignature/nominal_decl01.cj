// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %disInst %dumpCHIRDebug  %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/0\_AST\_CHIR.chir | compare %f
// (not Windows) ASSERT: scan-1 interface @_CN7default3IIIIG_E<Generic-_CN7default3IIIIG_E1TE> {
// (not Windows) ASSERT: scan-1 enum @_CN7default3EEEIG_E<Generic-_CN7default3EEEIG_E1TE> <: @_CN7default3IIIIG_E<Generic-_CN7default3EEEIG_E1TE> {
// (not Windows) ASSERT: scan-1 struct @_CN7default3SSSIG_E<Generic-_CN7default3SSSIG_E1UE> <: @_CN7default3IIIIG_E<Generic-_CN7default3SSSIG_E1UE> {
// (not Windows) ASSERT: scan-1 class @_CN7default3CCCIG_E<Generic-_CN7default3CCCIG_E1XE> <: @_CNat6ObjectE & @_CN7default3IIIIG_E<Bool> {
// (not Windows) ASSERT: scan-1 extend<Generic-_CN7defaultXCNY_3CCCIF0bG_EEU00000000jO7MuK_1TE> @_CN7default3CCCIG_E<(Generic-_CN7defaultXCNY_3CCCIF0bG_EEU00000000jO7MuK_1TE) -> Bool> <: @_CN7default3IIIIG_E<Int32> {

interface III<T> {}

enum EEE<T> <: III<T> {
    RED
}

struct SSS<U> <: III<U> {}

class CCC<X> <: III<Bool> {}

extend<T> CCC<(T) -> Bool> <: III<Int32> {}

main() {}

/*
[generic] [internal] struct @_CN7default3SSSIG_E<Generic-_CN7default3SSSIG_E1UE> <: @_CN7default3IIIIG_E<Generic-_CN7default3SSSIG_E1UE> { // srcCodeIdentifier: SSS, , loc: "test.cj"-14-1, scope: 0, , isVisible: true, packageName: default
  [public] [noDebugInfo] [compilerAdd] func @_CN7default3SSSIG_E6<init>Hv: (Struct-_CN7default3SSSIG_E<Generic-_CN7default3SSSIG_E1UE>&) -> Void
}

[generic] [internal] interface @_CN7default3IIIIG_E<Generic-_CN7default3IIIIG_E1TE> { // srcCodeIdentifier: III, , loc: "test.cj"-10-1, scope: 0, linkType: external, , isVisible: true, packageName: default
}

[generic] [internal] class @_CN7default3CCCIG_E<Generic-_CN7default3CCCIG_E1XE> <: @_CNat6ObjectE & @_CN7default3IIIIG_E<Bool> { // srcCodeIdentifier: CCC, , loc: "test.cj"-16-1, scope: 0, linkType: external, , isVisible: true, packageName: default
  [public] [noDebugInfo] [compilerAdd] func @_CN7default3CCCIG_E6<init>Hv: (Class-_CN7default3CCCIG_E<Generic-_CN7default3CCCIG_E1XE>&) -> Void
}

[generic] [internal] enum @_CN7default3EEEIG_E<Generic-_CN7default3EEEIG_E1TE> <: @_CN7default3IIIIG_E<Generic-_CN7default3EEEIG_E1TE> { // srcCodeIdentifier: EEE, , loc: "test.cj"-12-1, scope: 0, , isVisible: true, packageName: default
  RED

}

[generic] [internal] extend<Generic-_CN7defaultXCNY_3CCCIF0bG_EEU_K_1TE> @_CN7default3CCCIG_E<(Generic-_CN7defaultXCNY_3CCCIF0bG_EEU_K_1TE) -> Bool> <: @_CN7default3IIIIG_E<Int32> { // loc: "test.cj"-18-1, scope: 0, , isVisible: true, packageName: default
}
*/
