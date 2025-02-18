<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Grade Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4 text-center">
            <h2 class="text-success">Student Result</h2>
            
            <%
                float math = Float.parseFloat(request.getParameter("math"));
                float eng = Float.parseFloat(request.getParameter("eng"));
                float hnd = Float.parseFloat(request.getParameter("hnd"));
                float sci = Float.parseFloat(request.getParameter("sci"));
                float cs = Float.parseFloat(request.getParameter("cs"));

                float total = math + eng + hnd + sci + cs;
                float avg = total / 5;
                String grade = "";

                if (avg >= 90) grade = "A+";
                else if (avg >= 80) grade = "A";
                else if (avg >= 75) grade = "B+";
                else if (avg >= 70) grade = "B";
                else if (avg >= 60) grade = "C+";
                else if (avg >= 50) grade = "C";
                else if (avg >= 40) grade = "D";
                else grade = "Fail";
            %>

            <p class="fs-4">Total Marks: <strong><%= total %></strong></p>
            <p class="fs-4">Average Percentage: <strong><%= avg %>%</strong></p>
            <p class="fs-4">Grade: <strong class="text-danger"><%= grade %></strong></p>

            <a href="index.jsp" class="btn btn-primary mt-3">Calculate Again</a>
        </div>
    </div>

</body>
</html>
