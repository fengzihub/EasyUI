package cn.wolfcode.util;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by Administrator on 2018.01.02.
 */
@Getter
@Setter
public class AjaxResult {
    private boolean success;
    private String msg;

    public AjaxResult(boolean success, String msg) {
        this.msg = msg;
        this.success = success;
    }

    public AjaxResult(String msg) {
        this.msg = msg;
    }
}
