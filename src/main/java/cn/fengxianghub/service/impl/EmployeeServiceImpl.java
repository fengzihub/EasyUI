package cn.fengxianghub.service.impl;

import cn.fengxianghub.domain.Employee;
import cn.fengxianghub.mapper.EmployeeMapper;
import cn.fengxianghub.query.EmployeeQueryObject;
import cn.fengxianghub.service.IEmployeeService;
import cn.fengxianghub.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

/**
 * Created by Administrator on 2018.02.06.
 */
@Service
@Transactional
public class EmployeeServiceImpl implements IEmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public int save(Employee employee) {
        return employeeMapper.insert(employee);
    }

    @Override
    public int update(Employee employee) {
        return employeeMapper.updateByPrimaryKey(employee);
    }

    @Override
    public void delete(Long id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Employee get(Long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Employee> selectAll() {
        return employeeMapper.selectAll();
    }

    @Override
    public PageResult queryPage(EmployeeQueryObject qo) {
        int total = employeeMapper.queryForCount(qo);

        if (total == 0) {
            return new PageResult(total, Collections.EMPTY_LIST);
        }

        List<Employee> employees = employeeMapper.queryForList(qo);

        return new PageResult(total, employees);
    }
}
