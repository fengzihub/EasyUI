package cn.fengxianghub.service;

import cn.fengxianghub.domain.Employee;
import cn.fengxianghub.query.EmployeeQueryObject;
import cn.fengxianghub.util.PageResult;

import java.util.List;

/**
 * Created by Administrator on 2018.02.06.
 */
public interface IEmployeeService {
    int save(Employee employee);

    int update(Employee employee);

    void delete(Long id);

    Employee get(Long id);

    List<Employee> selectAll();

    PageResult queryPage(EmployeeQueryObject qo);
}
