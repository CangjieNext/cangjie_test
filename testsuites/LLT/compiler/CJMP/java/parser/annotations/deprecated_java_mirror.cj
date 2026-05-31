// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

// ASSERT: scan-not error
import java.lang.JObject

@JavaMirror
public open class M <: JObject {
    public init()
}

/* SCAN-IN
warning: '@JavaMirror' is deprecated; use '@Java foreign' instead
*/
