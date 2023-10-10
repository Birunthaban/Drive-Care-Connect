<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONObject" %>

<%
// Extract the authorization code from the request parameters
String authorizationCode = request.getParameter("code");

if (authorizationCode == null || authorizationCode.isEmpty()) {
    // Handle the case where the authorization code is missing
    out.println("Authorization code is missing.");
} else {
    // Define token endpoint and client credentials
    String tokenEndpoint = "https://api.asgardeo.io/t/birunthaban/oauth2/token";
    String clientId = "Yb0SLskZKAQHsgNs2ffFQ84evf0a";
    String clientSecret = "5hhrnl9tOTKcNVnRPJ8_uUmwHW08Uf9CRydZpA6ra7Ua";
    String redirectUri = "http://localhost:8082/Drive_Care_Connect/authorization.jsp";

    try {
        // Construct the request data for token exchange
        String requestData = "code=" + authorizationCode +
                "&grant_type=authorization_code" +
                "&client_id=" + clientId +
                "&client_secret=" + clientSecret +
                "&redirect_uri=" + URLEncoder.encode(redirectUri, "UTF-8");

        // Create a URL object for the token endpoint
        URL tokenUrl = new URL(tokenEndpoint);

        // Open a connection to the token endpoint
        HttpURLConnection tokenConnection = (HttpURLConnection) tokenUrl.openConnection();

        // Set the request method to POST
        tokenConnection.setRequestMethod("POST");

        // Enable input/output streams
        tokenConnection.setDoOutput(true);

        // Write the request data to the output stream
        try (DataOutputStream tokenOutputStream = new DataOutputStream(tokenConnection.getOutputStream())) {
            tokenOutputStream.writeBytes(requestData);
            tokenOutputStream.flush();
        }

        // Get the response code from the token endpoint
        int tokenResponseCode = tokenConnection.getResponseCode();

        // Read the response data from the token endpoint
        try (BufferedReader tokenReader = new BufferedReader(new InputStreamReader(tokenConnection.getInputStream()))) {
            String tokenInputLine;
            StringBuilder tokenResponse = new StringBuilder();

            while ((tokenInputLine = tokenReader.readLine()) != null) {
                tokenResponse.append(tokenInputLine);
            }

            // Handle the response data here
            String responseDataStr = tokenResponse.toString();

            // Parse the response data as JSON
            JSONObject jsonResponse = new JSONObject(responseDataStr);

            // Extract access_token and id_token
            String access_token = jsonResponse.getString("access_token");
            String id_token = jsonResponse.getString("id_token");

            // Store tokens in session attributes
            request.getSession().setAttribute("access_token", access_token);
            request.getSession().setAttribute("id_token", id_token);

            response.sendRedirect("home.jsp");
        }
    } catch (IOException e) {
        e.printStackTrace();
        // Handle the exception here, e.g., by displaying an error page.
    }
}
%>