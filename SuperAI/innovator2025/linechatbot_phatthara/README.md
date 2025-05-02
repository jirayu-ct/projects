# API Endpoints Summary

## Authentication

| Endpoint        | Method | Description   | Body                                                                                                                                                                                                                        |
| --------------- | ------ | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/api/login`    | POST   | Login user    | `{ "username": "uname", "password": "123" }`                                                                                                                                                                                |
| `/api/register` | POST   | Register user | `{"username": "uname", "password": "123", "email": "me@gmail.com2", "firstName": "fname", "lastName": "lname", "birthDate": "1999-01-01", "gender": "male","address": "123 Main Street, Cityville", "phone": "1234567890"}` |

## addRole

| Endpoint               | Method | Description      | Body                                    |
| ---------------------- | ------ | ---------------- | --------------------------------------- |
| `/api/role/11`         | GET    | get roleuser     | None                                    |
| `/api/role`            | POST   | list role user   | `{ "userId": 11, "newRole": "parent" }` |
| `/api/role/11/student` | DELETE | remove role user | None                                    |


## student

| Endpoint       | Method | Description       | Body |
| -------------- | ------ | ----------------- | ---- |
| `/api/student` | POST   | ดึงข้อมูลนักเรียนทั้งหมด | None |
| `/api/part`    | POST   | desc              | None |


## name

| Endpoint    | Method | Description | Body                  |
| ----------- | ------ | ----------- | --------------------- |
| `/api/part` | POST   | desc        | `{ "name": "Test1" }` |
| `/api/part` | POST   | desc        | None                  |