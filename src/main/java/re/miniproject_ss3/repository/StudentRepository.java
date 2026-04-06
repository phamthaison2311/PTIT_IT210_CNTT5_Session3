package re.miniproject_ss3.repository;

import org.springframework.stereotype.Repository;
import re.miniproject_ss3.model.Student;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StudentRepository {
    private List<Student> students = new ArrayList<>();

    public StudentRepository() {
        students.add(new Student(1, "Phạm Thái Sơn", "PTIT-HN-241", "CNTT", 2024, 3.8, "Đang học"));
        students.add(new Student(2, "Hồ Khánh Linh", "PTIT-HN-200", "CNTT", 2024, 3, "Đang học"));
        students.add(new Student(3, "Nguyễn Hữu Đại", "HN-K24_290", "CNTT", 2024, 3.5, "Đang học"));
        students.add(new Student(4, "Lê Thanh Tùng", "PTIT-HN-241", "CNTT", 2024, 3.8, "Đang học"));
        students.add(new Student(5, "Hà Bích Ngọc", "PTIT-HN-241", "CNTT", 2024, 5.8, "Đang học"));
    }

    public List<Student> findAll() {
        return students;
    }
}
