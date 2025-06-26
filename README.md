# 📝 Django Todo App

A simple Todo List application built with Django. Add, complete, and delete tasks with ease.

---

## 🚀 Features

* Add new tasks
* Mark tasks as complete/incomplete
* Delete tasks
* Basic Django admin integration

---

## 📦 Tech Stack

* Python 3.8+
* Django 4.x
* HTML/CSS (basic)

---

## 👷 Setup Instructions

1. **Clone the repo**:

   ```bash
   git clone https://github.com/your-username/django-todo.git
   cd django-todo
   ```

2. **Create virtual environment**:

   ```bash
   python -m venv venv
   source venv/bin/activate   # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

4. **Apply migrations**:

   ```bash
   python manage.py migrate
   ```

5. **Run the development server**:

   ```bash
   python manage.py runserver
   ```

6. **Visit in browser**:

   ```
   http://127.0.0.1:8000/
   ```

---

## 🔪 Running Tests

```bash
python manage.py test
```

---

## 🩹 Linting with Flake8

```bash
flake8 .
```

To ignore line length (E501) or migrations, use:

```bash
flake8 . --exclude=migrations --ignore=E501
```

---

## 📁 Project Structure

```
todo_project/
️
├── config/             # Django project settings
├── todo/               # Todo app
│   ├── migrations/
│   ├── templates/todo/
│   └── views.py
│
├── db.sqlite3          # SQLite database
├── manage.py
├── requirements.txt
└── README.md
```

---

## ✅ License

This project is licensed under the MIT License.
