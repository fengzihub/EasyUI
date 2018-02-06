package cn.fengxianghub.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QueryObject {
    private int page = 1; //默认
    private int rows = 5;

    public int getStart() {
        return (page - 1) * rows;
    }

}


