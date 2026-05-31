// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// ASSERT: scan-not error
// ASSERT: scan-not warning

import objc.lang.ObjCId

@ObjC
public foreign interface M <: ObjCId {}
