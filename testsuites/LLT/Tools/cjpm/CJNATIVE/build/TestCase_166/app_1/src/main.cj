package app_1

import app_1.com.bs.gfunc_524283
import app_1.com.bs.infra.gfunc_524287
import app_1.com.bs.infra.gfunc_524288
import app_1.com.bs.model.gfunc_524292
import app_1.com.bs.web.gfunc_524298

func main_logic() {
    let depth: Int64 = 5
    gfunc_524283(depth - 1)
    gfunc_524287(depth - 1)
    gfunc_524288(depth - 1)
    gfunc_524292(depth - 1)
    gfunc_524298(depth - 1)
}

@C
public func cangjie_main(): Unit {
    var ret = 1
    try {
        main_logic()
    } catch (e: Exception) {
        ret = 1
        e.printStackTrace()
    } finally {
        print("cj_main_return_start${ret}cj_main_return_end")
    }
}

@When[os != "iOS"]
main(): Unit {
    main_logic()
}
