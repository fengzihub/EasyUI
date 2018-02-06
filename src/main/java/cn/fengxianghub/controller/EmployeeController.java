package cn.fengxianghub.controller;

import cn.fengxianghub.domain.Employee;
import cn.fengxianghub.query.EmployeeQueryObject;
import cn.fengxianghub.service.IEmployeeService;
import cn.fengxianghub.util.AjaxResult;
import cn.fengxianghub.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018.02.06.
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;

    @RequestMapping("/index1")
    public String index1() {
        return "index";
    }
    @RequestMapping("/index")
    public String index() {
        return "employee";
    }
    @RequestMapping("/list")
    @ResponseBody
    public PageResult list(EmployeeQueryObject qo) {
        return employeeService.queryPage(qo);
    }

    @RequestMapping("/save")
    @ResponseBody
    public AjaxResult save(Employee employee) {
        try {
            employeeService.save(employee);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(false, e.getMessage());
        }
        return new AjaxResult(true, "保存成功");
    }

    @RequestMapping("/update")
    @ResponseBody
    public AjaxResult update(Employee employee) {
        try {
            employeeService.update(employee);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(false, e.getMessage());
        }
        return new AjaxResult(true, "编辑成功");
    }
    @RequestMapping("/delete")
    @ResponseBody
    public AjaxResult delete(Long id) {
        try {
            employeeService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new AjaxResult(false, e.getMessage());
        }
        return new AjaxResult(true, "删除成功");
    }




}
