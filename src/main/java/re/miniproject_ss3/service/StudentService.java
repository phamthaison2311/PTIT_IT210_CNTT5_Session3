package re.miniproject_ss3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import re.miniproject_ss3.model.Student;
import re.miniproject_ss3.repository.StudentRepository;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class StudentService {

    @Autowired
    private StudentRepository repository;

    // UC-01 & UC-03: Xử lý Lọc và Sắp xếp
    public List<Student> getFilteredAndSortedStudents(String sortBy, String search, String faculty) {
        List<Student> list = repository.findAll();
        Stream<Student> stream = list.stream();

        // UC-03: Tìm kiếm theo tên
        if (search != null && !search.isEmpty()) {
            stream = stream.filter(s -> s.getFullName().toLowerCase().contains(search.toLowerCase()));
        }

        // UC-03: Lọc theo khoa
        if (faculty != null && !faculty.isEmpty()) {
            stream = stream.filter(s -> s.getFaculty().equalsIgnoreCase(faculty));
        }

        // UC-01: Sắp xếp
        if ("name".equals(sortBy)) {
            return stream.sorted(Comparator.comparing(Student::getFullName)).collect(Collectors.toList());
        } else if ("gpa".equals(sortBy)) {
            return stream.sorted(Comparator.comparing(Student::getGpa).reversed()).collect(Collectors.toList());
        }

        return stream.collect(Collectors.toList());
    }

    // UC-02: Tìm sinh viên theo ID để xem chi tiết
    public Student findById(int id) {
        return repository.findAll().stream()
                .filter(s -> s.getId() == id)
                .findFirst()
                .orElse(null);
    }

    // UC-04: Tính toán thống kê Dashboard
    public Map<String, Object> getDashboardStats() {
        List<Student> list = repository.findAll();
        Map<String, Object> stats = new HashMap<>();

        int total = list.size();

        double avgGpa = list.stream().mapToDouble(Student::getGpa).average().orElse(0.0);
        Student valedictorian = list.stream().max(Comparator.comparing(Student::getGpa)).orElse(null);

        // Đếm số lượng theo trạng thái
        long countStudying = list.stream().filter(s -> "Đang học".equals(s.getStatus())).count();
        long countReserved = list.stream().filter(s -> "Bảo lưu".equals(s.getStatus())).count();
        long countGraduated = list.stream().filter(s -> "Tốt nghiệp".equals(s.getStatus())).count();

        // Tính tỷ lệ % cho từng trạng thái
        double pctStudying = (total > 0) ? (countStudying * 100.0 / total) : 0;
        double pctReserved = (total > 0) ? (countReserved * 100.0 / total) : 0;
        double pctGraduated = (total > 0) ? (countGraduated * 100.0 / total) : 0;

        stats.put("total", total);
        stats.put("avgGpa", Math.round(avgGpa * 100.0) / 100.0);
        stats.put("valedictorian", valedictorian);

        stats.put("pctStudying", Math.round(pctStudying * 10.0) / 10.0);
        stats.put("pctReserved", Math.round(pctReserved * 10.0) / 10.0);
        stats.put("pctGraduated", Math.round(pctGraduated * 10.0) / 10.0);

        return stats;
    }
}