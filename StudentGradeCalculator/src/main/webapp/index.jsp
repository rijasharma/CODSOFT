<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Grade Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Student Grade Calculator</h2>
            <form action="result.jsp" method="post">
                <div class="mb-3">
                    <label class="form-label">Marks in Math:</label>
                    <input type="number" name="math" class="form-control" required min="0" max="100">
                </div>
                <div class="mb-3">
                    <label class="form-label">Marks in English:</label>
                    <input type="number" name="eng" class="form-control" required min="0" max="100">
                </div>
                <div class="mb-3">
                    <label class="form-label">Marks in Hindi:</label>
                    <input type="number" name="hnd" class="form-control" required min="0" max="100">
                </div>
                <div class="mb-3">
                    <label class="form-label">Marks in Science:</label>
                    <input type="number" name="sci" class="form-control" required min="0" max="100">
                </div>
                <div class="mb-3">
                    <label class="form-label">Marks in Computer Science:</label>
                    <input type="number" name="cs" class="form-control" required min="0" max="100">
                </div>
                <button type="submit" class="btn btn-primary w-100">Calculate Grade</button>
            </form>
        </div>
    </div>

</body>
</html>
