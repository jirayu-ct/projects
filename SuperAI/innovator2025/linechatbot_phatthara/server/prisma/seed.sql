-- Insert Departments
INSERT INTO Departments (name, createdAt, updatedAt) VALUES
('วิทยาศาสตร์', NOW(), NOW()),
('คณิตศาสตร์', NOW(), NOW()),
('ภาษาไทย', NOW(), NOW()),
('ภาษาอังกฤษ', NOW(), NOW()),
('สังคมศึกษา', NOW(), NOW()),
('ศิลปะ', NOW(), NOW()),
('พลศึกษา', NOW(), NOW()),
('การงานอาชีพ', NOW(), NOW()),
('คอมพิวเตอร์', NOW(), NOW()),
('ดนตรี', NOW(), NOW());

-- Insert ClassGroups
INSERT INTO ClassGroups (name, createdAt, updatedAt) VALUES
('ม.1/1', NOW(), NOW()),
('ม.1/2', NOW(), NOW()),
('ม.2/1', NOW(), NOW()),
('ม.2/2', NOW(), NOW()),
('ม.3/1', NOW(), NOW()),
('ม.3/2', NOW(), NOW()),
('ม.4/1', NOW(), NOW()),
('ม.4/2', NOW(), NOW()),
('ม.5/1', NOW(), NOW()),
('ม.5/2', NOW(), NOW());

-- Insert Buildings
INSERT INTO Buildings (name, code, createdAt, updatedAt) VALUES
('อาคาร 1', 'B1', NOW(), NOW()),
('อาคาร 2', 'B2', NOW(), NOW()),
('อาคาร 3', 'B3', NOW(), NOW()),
('อาคาร 4', 'B4', NOW(), NOW()),
('อาคาร 5', 'B5', NOW(), NOW()),
('อาคาร 6', 'B6', NOW(), NOW()),
('อาคาร 7', 'B7', NOW(), NOW()),
('อาคาร 8', 'B8', NOW(), NOW()),
('อาคาร 9', 'B9', NOW(), NOW()),
('อาคาร 10', 'B10', NOW(), NOW());

-- Insert Category
INSERT INTO Category (name, createdAt, updatedAt) VALUES
('เครื่องเขียน', NOW(), NOW()),
('หนังสือ', NOW(), NOW()),
('เครื่องแบบ', NOW(), NOW()),
('อุปกรณ์กีฬา', NOW(), NOW()),
('ของใช้ส่วนตัว', NOW(), NOW()),
('อาหาร', NOW(), NOW()),
('เครื่องดื่ม', NOW(), NOW()),
('ของที่ระลึก', NOW(), NOW()),
('อุปกรณ์คอมพิวเตอร์', NOW(), NOW()),
('อุปกรณ์ดนตรี', NOW(), NOW());

-- Insert Subject
INSERT INTO Subject (name, code, credits, createdAt, updatedAt) VALUES
('คณิตศาสตร์พื้นฐาน', 'MATH101', 3, NOW(), NOW()),
('วิทยาศาสตร์พื้นฐาน', 'SCI101', 3, NOW(), NOW()),
('ภาษาไทย', 'THAI101', 3, NOW(), NOW()),
('ภาษาอังกฤษ', 'ENG101', 3, NOW(), NOW()),
('สังคมศึกษา', 'SOC101', 3, NOW(), NOW()),
('ศิลปะ', 'ART101', 2, NOW(), NOW()),
('พลศึกษา', 'PE101', 2, NOW(), NOW()),
('การงานอาชีพ', 'WORK101', 2, NOW(), NOW()),
('คอมพิวเตอร์', 'COM101', 2, NOW(), NOW()),
('ดนตรี', 'MUS101', 2, NOW(), NOW());

-- Insert Users (for teachers, students, and parents)
INSERT INTO User (username, email, password, firstName, lastName, birthDate, gender, address, phone, enabled, createdAt, updatedAt) VALUES
-- Teachers
('teacher1', 'teacher1@school.com', '$2b$10$examplehash1', 'สมชาย', 'ใจดี', '1980-01-01', 'ชาย', '123 ถนนสุขุมวิท', '0812345678', true, NOW(), NOW()),
('teacher2', 'teacher2@school.com', '$2b$10$examplehash2', 'สมหญิง', 'ใจเย็น', '1981-02-02', 'หญิง', '456 ถนนรัชดา', '0823456789', true, NOW(), NOW()),
('teacher3', 'teacher3@school.com', '$2b$10$examplehash3', 'สมหมาย', 'ใจกว้าง', '1982-03-03', 'ชาย', '789 ถนนลาดพร้าว', '0834567890', true, NOW(), NOW()),
-- Students
('student1', 'student1@school.com', '$2b$10$examplehash4', 'เด็กชาย', 'ดีมาก', '2008-04-04', 'ชาย', '321 ถนนสุขุมวิท', '0845678901', true, NOW(), NOW()),
('student2', 'student2@school.com', '$2b$10$examplehash5', 'เด็กหญิง', 'สวยงาม', '2008-05-05', 'หญิง', '654 ถนนรัชดา', '0856789012', true, NOW(), NOW()),
('student3', 'student3@school.com', '$2b$10$examplehash6', 'เด็กชาย', 'เก่งมาก', '2008-06-06', 'ชาย', '987 ถนนลาดพร้าว', '0867890123', true, NOW(), NOW()),
-- Parents
('parent1', 'parent1@school.com', '$2b$10$examplehash7', 'พ่อ', 'ของเด็กชาย', '1975-07-07', 'ชาย', '123 ถนนสุขุมวิท', '0878901234', true, NOW(), NOW()),
('parent2', 'parent2@school.com', '$2b$10$examplehash8', 'แม่', 'ของเด็กหญิง', '1976-08-08', 'หญิง', '456 ถนนรัชดา', '0889012345', true, NOW(), NOW()),
('parent3', 'parent3@school.com', '$2b$10$examplehash9', 'พ่อ', 'ของเด็กชาย', '1977-09-09', 'ชาย', '789 ถนนลาดพร้าว', '0890123456', true, NOW(), NOW()),
('admin1', 'admin@school.com', '$2b$10$examplehash10', 'ผู้ดูแล', 'ระบบ', '1970-10-10', 'ชาย', '111 ถนนราชดำริ', '0801234567', true, NOW(), NOW());

-- Insert UserRoles
INSERT INTO UserRole (userId, role, createdAt, updatedAt) VALUES
(1, 'teacher', NOW(), NOW()),
(2, 'teacher', NOW(), NOW()),
(3, 'teacher', NOW(), NOW()),
(4, 'student', NOW(), NOW()),
(5, 'student', NOW(), NOW()),
(6, 'student', NOW(), NOW()),
(7, 'parent', NOW(), NOW()),
(8, 'parent', NOW(), NOW()),
(9, 'parent', NOW(), NOW()),
(10, 'admin', NOW(), NOW());

-- Insert RolePermissions
INSERT INTO RolePermission (role, permission, createdAt, updatedAt) VALUES
('admin', 'VIEW_DASHBOARD', NOW(), NOW()),
('admin', 'MANAGE_USERS', NOW(), NOW()),
('admin', 'MANAGE_ROLES', NOW(), NOW()),
('teacher', 'MANAGE_STUDENTS', NOW(), NOW()),
('teacher', 'MANAGE_GRADES', NOW(), NOW()),
('teacher', 'MANAGE_SCHEDULES', NOW(), NOW()),
('student', 'VIEW_GRADES', NOW(), NOW()),
('student', 'VIEW_SCHEDULES', NOW(), NOW()),
('parent', 'VIEW_CHILD_GRADES', NOW(), NOW()),
('parent', 'VIEW_CHILD_SCHEDULES', NOW(), NOW());

-- Insert Teachers
INSERT INTO Teacher (userId, departmentId, status, createdAt, updatedAt) VALUES
(1, 1, 'active', NOW(), NOW()),
(2, 2, 'active', NOW(), NOW()),
(3, 3, 'active', NOW(), NOW()),
(1, 4, 'active', NOW(), NOW()),
(2, 5, 'active', NOW(), NOW()),
(3, 6, 'active', NOW(), NOW()),
(1, 7, 'active', NOW(), NOW()),
(2, 8, 'active', NOW(), NOW()),
(3, 9, 'active', NOW(), NOW()),
(1, 10, 'active', NOW(), NOW());

-- Insert Students
INSERT INTO Student (userId, classId, status, createdAt, updatedAt) VALUES
(4, 1, 'active', NOW(), NOW()),
(5, 1, 'active', NOW(), NOW()),
(6, 2, 'active', NOW(), NOW()),
(4, 2, 'active', NOW(), NOW()),
(5, 3, 'active', NOW(), NOW()),
(6, 3, 'active', NOW(), NOW()),
(4, 4, 'active', NOW(), NOW()),
(5, 4, 'active', NOW(), NOW()),
(6, 5, 'active', NOW(), NOW()),
(4, 5, 'active', NOW(), NOW());

-- Insert Parents
INSERT INTO Parent (userId, status, createdAt, updatedAt) VALUES
(7, 'active', NOW(), NOW()),
(8, 'active', NOW(), NOW()),
(9, 'active', NOW(), NOW()),
(7, 'active', NOW(), NOW()),
(8, 'active', NOW(), NOW()),
(9, 'active', NOW(), NOW()),
(7, 'active', NOW(), NOW()),
(8, 'active', NOW(), NOW()),
(9, 'active', NOW(), NOW()),
(7, 'active', NOW(), NOW());

-- Insert StudentParents
INSERT INTO StudentParents (studentId, parentId, isPrimary, createdAt, updatedAt) VALUES
(1, 1, true, NOW(), NOW()),
(2, 2, true, NOW(), NOW()),
(3, 3, true, NOW(), NOW()),
(4, 1, false, NOW(), NOW()),
(5, 2, false, NOW(), NOW()),
(6, 3, false, NOW(), NOW()),
(7, 1, true, NOW(), NOW()),
(8, 2, true, NOW(), NOW()),
(9, 3, true, NOW(), NOW()),
(10, 1, false, NOW(), NOW());

-- Insert StudentAdvisor
INSERT INTO StudentAdvisor (studentId, teacherId, advisorRole, advisorStatus, createdAt, updatedAt) VALUES
(1, 1, 'homeroom', 'active', NOW(), NOW()),
(2, 2, 'counselor', 'active', NOW(), NOW()),
(3, 3, 'special', 'active', NOW(), NOW()),
(4, 1, 'temporary', 'active', NOW(), NOW()),
(5, 2, 'homeroom', 'active', NOW(), NOW()),
(6, 3, 'counselor', 'active', NOW(), NOW()),
(7, 1, 'special', 'active', NOW(), NOW()),
(8, 2, 'temporary', 'active', NOW(), NOW()),
(9, 3, 'homeroom', 'active', NOW(), NOW()),
(10, 1, 'counselor', 'active', NOW(), NOW());

-- Insert Classroom
INSERT INTO Classroom (name, bulidingsId, floor, type, createdAt, updatedAt) VALUES
('ห้อง 101', 1, 1, 'normal', NOW(), NOW()),
('ห้อง 102', 1, 1, 'lab', NOW(), NOW()),
('ห้อง 201', 2, 2, 'normal', NOW(), NOW()),
('ห้อง 202', 2, 2, 'lab', NOW(), NOW()),
('ห้อง 301', 3, 3, 'normal', NOW(), NOW()),
('ห้อง 302', 3, 3, 'lab', NOW(), NOW()),
('ห้อง 401', 4, 4, 'normal', NOW(), NOW()),
('ห้อง 402', 4, 4, 'lab', NOW(), NOW()),
('ห้อง 501', 5, 5, 'normal', NOW(), NOW()),
('ห้อง 502', 5, 5, 'lab', NOW(), NOW());

-- Insert ClassSchedule
INSERT INTO ClassSchedule (classGroupId, subjectId, teacherId, classroomId, dayOfWeek, startTime, endTime, term, academicYear, createdAt, updatedAt) VALUES
(1, 1, 1, 1, 'monday', '2024-01-01 08:00:00', '2024-01-01 09:00:00', 'semester1', 2024, NOW(), NOW()),
(2, 2, 2, 2, 'tuesday', '2024-01-02 09:00:00', '2024-01-02 10:00:00', 'semester1', 2024, NOW(), NOW()),
(3, 3, 3, 3, 'wednesday', '2024-01-03 10:00:00', '2024-01-03 11:00:00', 'semester1', 2024, NOW(), NOW()),
(4, 4, 1, 4, 'thursday', '2024-01-04 11:00:00', '2024-01-04 12:00:00', 'semester1', 2024, NOW(), NOW()),
(5, 5, 2, 5, 'friday', '2024-01-05 13:00:00', '2024-01-05 14:00:00', 'semester1', 2024, NOW(), NOW()),
(6, 6, 3, 6, 'monday', '2024-01-08 14:00:00', '2024-01-08 15:00:00', 'semester1', 2024, NOW(), NOW()),
(7, 7, 1, 7, 'tuesday', '2024-01-09 15:00:00', '2024-01-09 16:00:00', 'semester1', 2024, NOW(), NOW()),
(8, 8, 2, 8, 'wednesday', '2024-01-10 16:00:00', '2024-01-10 17:00:00', 'semester1', 2024, NOW(), NOW()),
(9, 9, 3, 9, 'thursday', '2024-01-11 17:00:00', '2024-01-11 18:00:00', 'semester1', 2024, NOW(), NOW()),
(10, 10, 1, 10, 'friday', '2024-01-12 18:00:00', '2024-01-12 19:00:00', 'semester1', 2024, NOW(), NOW());

-- Insert GradeHistory
INSERT INTO GradeHistory (studentId, subjectId, term, academicYear, grade, note, createdAt, updatedAt) VALUES
(1, 1, 'semester1', 2024, 3.5, 'ดีมาก', NOW(), NOW()),
(2, 2, 'semester1', 2024, 3.0, 'ดี', NOW(), NOW()),
(3, 3, 'semester1', 2024, 2.5, 'พอใช้', NOW(), NOW()),
(4, 4, 'semester1', 2024, 4.0, 'ดีเยี่ยม', NOW(), NOW()),
(5, 5, 'semester1', 2024, 3.5, 'ดีมาก', NOW(), NOW()),
(6, 6, 'semester1', 2024, 3.0, 'ดี', NOW(), NOW()),
(7, 7, 'semester1', 2024, 2.5, 'พอใช้', NOW(), NOW()),
(8, 8, 'semester1', 2024, 4.0, 'ดีเยี่ยม', NOW(), NOW()),
(9, 9, 'semester1', 2024, 3.5, 'ดีมาก', NOW(), NOW()),
(10, 10, 'semester1', 2024, 3.0, 'ดี', NOW(), NOW());

-- Insert Grade
INSERT INTO Grade (studentId, subjectId, term, academicYear, grade, gradeHistoryId, status, isFixed, createdAt, updatedAt) VALUES
(1, 1, 'semester1', 2024, 3.5, 1, '0', true, NOW(), NOW()),
(2, 2, 'semester1', 2024, 3.0, 2, '0', true, NOW(), NOW()),
(3, 3, 'semester1', 2024, 2.5, 3, '0', true, NOW(), NOW()),
(4, 4, 'semester1', 2024, 4.0, 4, '0', true, NOW(), NOW()),
(5, 5, 'semester1', 2024, 3.5, 5, '0', true, NOW(), NOW()),
(6, 6, 'semester1', 2024, 3.0, 6, '0', true, NOW(), NOW()),
(7, 7, 'semester1', 2024, 2.5, 7, '0', true, NOW(), NOW()),
(8, 8, 'semester1', 2024, 4.0, 8, '0', true, NOW(), NOW()),
(9, 9, 'semester1', 2024, 3.5, 9, '0', true, NOW(), NOW()),
(10, 10, 'semester1', 2024, 3.0, 10, '0', true, NOW(), NOW());

-- Insert Activiti
INSERT INTO Activiti (name, description, startDate, endDate, location, createdAt, updatedAt) VALUES
('กีฬาสี', 'กิจกรรมกีฬาสีประจำปี', '2024-01-15', '2024-01-17', 'สนามกีฬา', NOW(), NOW()),
('วันวิทยาศาสตร์', 'กิจกรรมวันวิทยาศาสตร์', '2024-02-15', '2024-02-15', 'อาคารวิทยาศาสตร์', NOW(), NOW()),
('วันภาษาไทย', 'กิจกรรมวันภาษาไทย', '2024-03-15', '2024-03-15', 'หอประชุม', NOW(), NOW()),
('วันเด็ก', 'กิจกรรมวันเด็ก', '2024-04-15', '2024-04-15', 'สนามกีฬา', NOW(), NOW()),
('วันครู', 'กิจกรรมวันครู', '2024-05-15', '2024-05-15', 'หอประชุม', NOW(), NOW()),
('วันแม่', 'กิจกรรมวันแม่', '2024-06-15', '2024-06-15', 'หอประชุม', NOW(), NOW()),
('วันพ่อ', 'กิจกรรมวันพ่อ', '2024-07-15', '2024-07-15', 'หอประชุม', NOW(), NOW()),
('วันลอยกระทง', 'กิจกรรมวันลอยกระทง', '2024-08-15', '2024-08-15', 'สระน้ำ', NOW(), NOW()),
('วันคริสต์มาส', 'กิจกรรมวันคริสต์มาส', '2024-09-15', '2024-09-15', 'หอประชุม', NOW(), NOW()),
('วันปีใหม่', 'กิจกรรมวันปีใหม่', '2024-10-15', '2024-10-15', 'หอประชุม', NOW(), NOW());

-- Insert StudentActiviti
INSERT INTO StudentActiviti (studentId, activitiId, participationStatus, note, createdAt, updatedAt) VALUES
(1, 1, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(2, 2, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(3, 3, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(4, 4, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(5, 5, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(6, 6, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(7, 7, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(8, 8, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(9, 9, true, 'เข้าร่วมกิจกรรม', NOW(), NOW()),
(10, 10, true, 'เข้าร่วมกิจกรรม', NOW(), NOW());

-- Insert Attendance
INSERT INTO Attendance (studentId, date, status, note, createdAt, updatedAt) VALUES
(1, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(2, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(3, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(4, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(5, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(6, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(7, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(8, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(9, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW()),
(10, '2024-01-01', 'present', 'มาเรียน', NOW(), NOW());

-- Insert Behavior
INSERT INTO Behavior (studentId, type, description, date, teacherId, createdAt, updatedAt) VALUES
(1, 'good', 'ช่วยเหลือเพื่อน', '2024-01-01', 1, NOW(), NOW()),
(2, 'good', 'ตั้งใจเรียน', '2024-01-02', 2, NOW(), NOW()),
(3, 'good', 'มีน้ำใจ', '2024-01-03', 3, NOW(), NOW()),
(4, 'good', 'มีความรับผิดชอบ', '2024-01-04', 1, NOW(), NOW()),
(5, 'good', 'มีระเบียบวินัย', '2024-01-05', 2, NOW(), NOW()),
(6, 'bad', 'มาเรียนสาย', '2024-01-06', 3, NOW(), NOW()),
(7, 'bad', 'ไม่ส่งการบ้าน', '2024-01-07', 1, NOW(), NOW()),
(8, 'bad', 'ไม่ตั้งใจเรียน', '2024-01-08', 2, NOW(), NOW()),
(9, 'bad', 'พูดคุยในห้องเรียน', '2024-01-09', 3, NOW(), NOW()),
(10, 'bad', 'ไม่ทำตามกฎ', '2024-01-10', 1, NOW(), NOW());

-- Insert Notification
INSERT INTO Notification (userId, type, title, message, isRead, createdAt, updatedAt) VALUES
(1, 'grade', 'ผลการเรียน', 'คุณได้เกรด 3.5', false, NOW(), NOW()),
(2, 'grade', 'ผลการเรียน', 'คุณได้เกรด 3.0', false, NOW(), NOW()),
(3, 'grade', 'ผลการเรียน', 'คุณได้เกรด 2.5', false, NOW(), NOW()),
(4, 'attendance', 'การเข้าเรียน', 'คุณมาเรียนตรงเวลา', false, NOW(), NOW()),
(5, 'attendance', 'การเข้าเรียน', 'คุณมาเรียนตรงเวลา', false, NOW(), NOW()),
(6, 'behavior', 'พฤติกรรม', 'คุณมีพฤติกรรมที่ดี', false, NOW(), NOW()),
(7, 'behavior', 'พฤติกรรม', 'คุณมีพฤติกรรมที่ดี', false, NOW(), NOW()),
(8, 'grade', 'ผลการเรียน', 'คุณได้เกรด 4.0', false, NOW(), NOW()),
(9, 'attendance', 'การเข้าเรียน', 'คุณมาเรียนตรงเวลา', false, NOW(), NOW()),
(10, 'behavior', 'พฤติกรรม', 'คุณมีพฤติกรรมที่ดี', false, NOW(), NOW());

-- Insert Shop
INSERT INTO Shop (name, price, categoryId, description, createdAt, updatedAt) VALUES
('ปากกา', 20.00, 1, 'ปากกาสีน้ำเงิน', NOW(), NOW()),
('สมุด', 30.00, 1, 'สมุดบันทึก', NOW(), NOW()),
('ยางลบ', 10.00, 1, 'ยางลบ 2B', NOW(), NOW()),
('ดินสอ', 15.00, 1, 'ดินสอ 2B', NOW(), NOW()),
('ไม้บรรทัด', 25.00, 1, 'ไม้บรรทัด 30 ซม.', NOW(), NOW()),
('หนังสือเรียน', 150.00, 2, 'หนังสือเรียนวิชาคณิตศาสตร์', NOW(), NOW()),
('เครื่องแบบนักเรียน', 500.00, 3, 'ชุดนักเรียนชาย', NOW(), NOW()),
('ลูกบอล', 200.00, 4, 'ลูกฟุตบอล', NOW(), NOW()),
('กระเป๋านักเรียน', 400.00, 5, 'กระเป๋านักเรียนสีดำ', NOW(), NOW()),
('น้ำดื่ม', 10.00, 6, 'น้ำดื่ม 500 มล.', NOW(), NOW()); 