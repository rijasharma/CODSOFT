<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Rija.Question" %>

<%
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");

    // Fix: Ensure the quiz starts properly
    if (questions == null || questions.isEmpty()) {
        response.sendRedirect("index.jsp"); // Redirect if no questions exist
        return;
    }
    if (currentQuestionIndex == null) {
        currentQuestionIndex = 0;
        session.setAttribute("currentQuestionIndex", currentQuestionIndex);
    }
    if (currentQuestionIndex >= questions.size()) {
        response.sendRedirect("result.jsp"); // Redirect to results when quiz is finished
        return;
    }

    Question question = questions.get(currentQuestionIndex);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        #timer {
            font-size: 18px;
            font-weight: bold;
            color: #d9534f;
            margin-bottom: 15px;
            text-align: center;
            animation: blink 1s infinite;
        }

        @keyframes blink {
            0% { opacity: 1; }
            50% { opacity: 0.6; }
            100% { opacity: 1; }
        }

        .quiz-container {
            max-width: 500px;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .options-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            margin-bottom: 20px;
        }

        .option {
            background-color: #eaeaea;
            padding: 10px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .option:hover {
            background-color: #d2d2d2;
        }

        input[type="radio"] {
            transform: scale(1.3);
            cursor: pointer;
        }

        button {
            width: 100%;
            height: 40px;
            font-size: 16px;
            background-color: #11C7B6;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #0fa69c;
        }
    </style>
    <script>
        var timeLeft = 10;

        function startTimer() {
            var timer = setInterval(function () {
                document.getElementById("timer").innerText = "Time Left: " + timeLeft + "s";
                timeLeft--;
                if (timeLeft < 0) {
                    clearInterval(timer);
                    document.getElementById("quizForm").submit();
                }
            }, 1000);
        }

        // Ensure the script runs after the page loads
        window.onload = function() {
            startTimer();
        };
    </script>
</head>
<body>
    <p id="timer">Time Left: 10s</p>
    <div class="quiz-container">
        <h2>Question <%= currentQuestionIndex + 1 %>: <%= question.getQuestionText() %></h2>
        <form id="quizForm" action="QuizServlet" method="post">
            <div class="options-container">
                <% for (int i = 0; i < question.getOptions().size(); i++) { %>
                    <label class="option">
                        <input type="radio" name="answer" value="<%= i %>" required>
                        <%= question.getOptions().get(i) %>
                    </label>
                <% } %>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
