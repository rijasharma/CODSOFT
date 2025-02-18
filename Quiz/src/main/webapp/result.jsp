<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Rija.Question" %>

<%
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    Integer score = (Integer) session.getAttribute("score");
    List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        /* Background Styling */
        body {
            background: url('back.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        /* Container Styling */
        .result-container {
            background: rgba(0, 0, 0, 0.8);
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            width: 80%;
            max-width: 600px;
            margin-top:360px;
        }

        h1, h2 {
            color: #FFD700;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
        }

        th {
            background: rgba(255, 255, 255, 0.2);
            color: #FFD700;
        }

        /* Correct & Incorrect Answer Styles */
        .correct {
            color: #4CAF50;
            font-weight: bold;
        }

        .incorrect {
            color: #FF5733;
            font-weight: bold;
        }

        /* Button Styling */
        .restart-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #11C7B6;
            color: white;
            font-size: 18px;
            font-weight: bold;
            border-radius: 6px;
            text-decoration: none;
            transition: background 0.3s;
        }

        .restart-btn:hover {
            background-color: #0fa69c;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h1>🎉 Quiz Completed 🎉</h1>
        <h2>Your Score: <%= score %> / <%= questions.size() %></h2>

        <h3>📋 Question Summary:</h3>
        <table>
            <tr>
                <th>#</th>
                <th>Question</th>
                <th>Your Answer</th>
                <th>Correct Answer</th>
                <th>Result</th>
            </tr>
            <%
                for (int i = 0; i < questions.size(); i++) {
                    Question question = questions.get(i);
                    int userAnswerIndex = userAnswers.get(i);
                    int correctAnswerIndex = question.getCorrectOptionIndex();
                    String userAnswer = userAnswerIndex >= 0 ? question.getOptions().get(userAnswerIndex) : "No Answer";
                    String correctAnswer = question.getOptions().get(correctAnswerIndex);
                    boolean isCorrect = userAnswerIndex == correctAnswerIndex;
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><%= question.getQuestionText() %></td>
                <td><%= userAnswer %></td>
                <td><%= correctAnswer %></td>
                <td class="<%= isCorrect ? "correct" : "incorrect" %>">
                    <%= isCorrect ? "✔ Correct" : "✘ Incorrect" %>
                </td>
            </tr>
            <% } %>
        </table>

        
    </div>
</body>
</html>
