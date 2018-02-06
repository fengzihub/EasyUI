package cn.wolfcode.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.sql.DataSource;

/**
 * Created by Administrator on 2018.02.06.
 */
@Controller
public class DataSourceController {
    @Autowired
    private DataSource dataSource;

    @RequestMapping("/data")
    @ResponseBody
    public String data() throws Exception {
        System.out.println(dataSource.getConnection());
        System.out.println(dataSource);
        return "hello";

    }
}
