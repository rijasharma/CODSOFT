<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Number Guessing Game</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4 text-center">
            <h2 class="text-primary">🎯 Number Guessing Game</h2>
            <p>Guess a number between 1 and 100. You have 5 attempts!</p>

            <form action="logic.jsp" method="post">
                <input type="hidden" name="attemptsLeft" value="5">
                <button type="submit" class="btn btn-success">Start Game</button>
            </form>
        </div>
    </div>

</body>
</html>
