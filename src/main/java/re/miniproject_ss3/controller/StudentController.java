package re.miniproject_ss3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import re.miniproject_ss3.service.StudentService;

import java.util.Map;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    // Hiển thị danh sách (UC-01, UC-03)
    @GetMapping("/students")
    public String list(@RequestParam(required = false) String sortBy,
                       @RequestParam(required = false) String search,
                       Model model) {
        model.addAttribute("students", studentService.getFilteredAndSortedStudents(sortBy, search, null));
        return "student-list";
    }

    // Xem chi tiết (UC-02)
    @GetMapping("/students/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        model.addAttribute("student", studentService.findById(id));
        return "student-detail";
    }

    // Xem thống kê (UC-4)
    @GetMapping("/students/dashboard")
    public String dashboard(Model model) {
        Map<String, Object> stats = studentService.getDashboardStats();
        model.addAttribute("stats", stats);
        return "dashboard";
    }
}