// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

// ASSERT: scan-not error
// ASSERT: scan '@JavaMirror' is deprecated
// ASSERT: scan '@JavaImpl' is deprecated

import java.lang.JObject

@JavaMirror
public open class M <: JObject {
    public init()
}

@JavaImpl
class A <: M {
    public init() {
        super()
    }
}
