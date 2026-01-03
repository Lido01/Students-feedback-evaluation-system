<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/style.css">

<div class="container">
    <h2>Submit Feedback</h2>

    <form action="submitFeedback" method="post">

        <label>Feedback Message</label>
        <textarea name="message" rows="4" required></textarea>

        <label>Visibility</label>
        <select name="visibility">
            <option value="ADMIN_ONLY">Admin Only</option>
            <option value="INSTRUCTOR_VISIBLE">Instructor Can See</option>
        </select>

        <label>Instructor (optional)</label>
        <select name="instructorId">
            <option value="">-- Select Instructor --</option>
        </select>

        <button type="submit">Send Feedback</button>
    </form>
</div>
