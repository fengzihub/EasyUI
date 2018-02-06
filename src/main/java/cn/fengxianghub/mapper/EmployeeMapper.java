package cn.fengxianghub.mapper;

import cn.fengxianghub.domain.Employee;
import cn.fengxianghub.query.EmployeeQueryObject;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);

    int queryForCount(EmployeeQueryObject qo);

    List<Employee> queryForList(EmployeeQueryObject qo);
}