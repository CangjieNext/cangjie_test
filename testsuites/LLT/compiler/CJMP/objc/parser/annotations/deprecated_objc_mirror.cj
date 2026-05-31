// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// ASSERT: scan-not error
import objc.lang.ObjCId

@ObjCMirror
public interface M <: ObjCId {}

/* SCAN-IN
warning: '@ObjCMirror' is deprecated; use '@ObjC foreign' instead
*/
