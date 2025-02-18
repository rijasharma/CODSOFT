<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.util.Random" %>
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

            <%
                // Get the session attribute or generate a random number
                Integer randomNumber = (Integer) session.getAttribute("randomNumber");
                Integer attemptsLeft = (Integer) session.getAttribute("attemptsLeft");

                if (randomNumber == null) {
                    Random rand = new Random();
                    randomNumber = rand.nextInt(100) + 1;
                    attemptsLeft = 5; // Reset attempts
                    session.setAttribute("randomNumber", randomNumber);
                    session.setAttribute("attemptsLeft", attemptsLeft);
                }

                String message = "";
                if (request.getParameter("guess") != null) {
                    try {
                        int guess = Integer.parseInt(request.getParameter("guess"));
                        attemptsLeft--;

                        if (guess == randomNumber) {
                            message = "<h3 class='text-success'>🎉 Congratulations! You guessed the correct number!</h3>";
                            session.invalidate(); // Reset the game
                        } else if (attemptsLeft == 0) {
                            message = "<h3 class='text-danger'>😢 Out of attempts! The correct number was " + randomNumber + ".</h3>";
                            session.invalidate(); // Reset the game
                        } else if (guess < randomNumber) {
                            message = "<h4 class='text-warning'>🔼 Too low! Try again.</h4>";
                        } else {
                            message = "<h4 class='text-warning'>🔽 Too high! Try again.</h4>";
                        }

                        session.setAttribute("attemptsLeft", attemptsLeft);
                    } catch (Exception e) {
                        message = "<h4 class='text-danger'>⚠ Invalid input! Please enter a number.</h4>";
                    }
                }
            %>

            <p><strong>Attempts Left: <%= attemptsLeft %></strong></p>

            <%= message %>

            <% if (attemptsLeft > 0) { %>
                <form method="post" action="logic.jsp">
                    <div class="mb-3">
                        <input type="number" name="guess" class="form-control" placeholder="Enter your guess" required min="1" max="100">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Guess</button>
                </form>
            <% } else { %>
                <a href="index.jsp" class="btn btn-success mt-3">Play Again</a>
            <% } %>

        </div>
    </div>

</body>
</html>
