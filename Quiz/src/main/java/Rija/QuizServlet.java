package Rija;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve session attributes
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");
        Integer score = (Integer) session.getAttribute("score");
        List<Integer> userAnswers = (List<Integer>) session.getAttribute("userAnswers");

        // Initialize quiz session variables only if it's a fresh session
        if (questions == null) {
            questions = new ArrayList<>();
            questions.add(new Question("Who is known as the 'King of Bollywood'?", 
            	    Arrays.asList("Salman Khan", "Amitabh Bachchan", "Shah Rukh Khan", "Ranbir Kapoor"), 2));

            	questions.add(new Question("Which was the first Bollywood movie to win an Oscar?", 
            	    Arrays.asList("Mother India", "Slumdog Millionaire", "Lagaan", "Gandhi"), 0));

            	questions.add(new Question("Who composed the music for the movie 'Dilwale Dulhania Le Jayenge'?", 
            	    Arrays.asList("A.R. Rahman", "Shankar-Ehsaan-Loy", "Jatin-Lalit", "Pritam"), 2));

            	questions.add(new Question("Which Bollywood actor is known as 'Mr. Perfectionist'?", 
            	    Arrays.asList("Shah Rukh Khan", "Hrithik Roshan", "Aamir Khan", "Ajay Devgn"), 2));

            	questions.add(new Question("What was the debut movie of Alia Bhatt as a lead actress?", 
            	    Arrays.asList("Highway", "Student of the Year", "Raazi", "Kapoor & Sons"), 1));

            	questions.add(new Question("Which Bollywood movie features the famous dialogue 'Mogambo Khush Hua'?", 
            	    Arrays.asList("Sholay", "Don", "Mr. India", "Deewar"), 2));

            	questions.add(new Question("Which Bollywood actress made her Hollywood debut in 'XXX: Return of Xander Cage'?", 
            	    Arrays.asList("Priyanka Chopra", "Deepika Padukone", "Katrina Kaif", "Aishwarya Rai"), 1));

            	questions.add(new Question("Which movie holds the record for being the highest-grossing Bollywood film?", 
            	    Arrays.asList("Dangal", "Pathaan", "Gadar 2", "Jawan"), 0));

            	questions.add(new Question("Who directed the Bollywood film 'Gully Boy'?", 
            	    Arrays.asList("Karan Johar", "Zoya Akhtar", "Rohit Shetty", "Anurag Kashyap"), 1));

            	questions.add(new Question("Which Indian actor has won the most Filmfare Best Actor awards?", 
            	    Arrays.asList("Amitabh Bachchan", "Dilip Kumar", "Shah Rukh Khan", "Hrithik Roshan"), 2));

            session.setAttribute("questions", questions);
            
            // Fix: Ensure `currentQuestionIndex` starts at 0
            currentQuestionIndex = 0;
            session.setAttribute("currentQuestionIndex", currentQuestionIndex);

            score = 0;
            userAnswers = new ArrayList<>();
            session.setAttribute("userAnswers", userAnswers);
            session.setAttribute("score", score);
        }

        // Process user's answer only if it's not the first load
        if (request.getParameter("answer") != null && currentQuestionIndex < questions.size()) {
            int selectedIndex = Integer.parseInt(request.getParameter("answer"));
            userAnswers.add(selectedIndex);

            Question currentQuestion = questions.get(currentQuestionIndex);
            if (selectedIndex == currentQuestion.getCorrectOptionIndex()) {
                score++;  // Increment score if correct
            }

            // Update session attributes
            session.setAttribute("score", score);
            session.setAttribute("userAnswers", userAnswers);

            // Move to the next question
            currentQuestionIndex++;
            session.setAttribute("currentQuestionIndex", currentQuestionIndex);
        }

        // Redirect to next question or result page if quiz is over
        if (currentQuestionIndex >= questions.size()) {
            response.sendRedirect("result.jsp");
        } else {
            response.sendRedirect("question.jsp");
        }
    }
}