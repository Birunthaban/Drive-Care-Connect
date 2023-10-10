<%@include file="structure.jsp"%>
<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page import="org.json.JSONObject" %>
<%
    // Extract the access_token and id_token from session attribute
        String accessToken = (String) request.getSession().getAttribute("access_token");
        String idToken = (String) request.getSession().getAttribute("id_token");

    // Check if the access token is not null or empty
    if (accessToken != null && !accessToken.isEmpty()) {
        // Define userinfo endpoint
        String userinfoEndpoint = "https://api.asgardeo.io/t/birunthaban/oauth2/userinfo";
        String introspectionEndpoint ="https://api.asgardeo.io/t/birunthaban/oauth2/introspect";


        try {
            // Create a URL object for the userinfo endpoint
            URL userinfoUrl = new URL(userinfoEndpoint);

            // Open a connection to the userinfo endpoint
            HttpURLConnection userinfoConnection = (HttpURLConnection) userinfoUrl.openConnection();

            // Set the request method to GET
            userinfoConnection.setRequestMethod("GET");

            // Set the Authorization header with the access token
            userinfoConnection.setRequestProperty("Authorization", "Bearer " + accessToken);

            // Get the response code from the userinfo endpoint
            int userinfoResponseCode = userinfoConnection.getResponseCode();

            // Read the response data from the userinfo endpoint
            try (BufferedReader userinfoReader = new BufferedReader(new InputStreamReader(userinfoConnection.getInputStream()))) {
                String userinfoInputLine;
                StringBuilder userinfoResponse = new StringBuilder();

                while ((userinfoInputLine = userinfoReader.readLine()) != null) {
                    userinfoResponse.append(userinfoInputLine);
                }

                // Parse the userinfo response data as JSON
                JSONObject userinfoJson = new JSONObject(userinfoResponse.toString());

                // Extract user information
                String username = userinfoJson.optString("username");
                String name = userinfoJson.optString("given_name");
                String email = userinfoJson.optString("email");
                
                String contactNumber = userinfoJson.optString("phone_number");
                String lastname = userinfoJson.optString("family_name");
                JSONObject addressObject = userinfoJson.optJSONObject("address");

                // Extract the "country" property from the "address" object
                String country = (addressObject != null) ? addressObject.optString("country") : "";
                
                session.setAttribute("username", username);
%>


        	<h3>Profile</h3>
        	<br>
        	<br>
        	
						      <p class="text-sm mb-0 text-capitalize">USERNAME</p>
						      <h4 class="mb-0"><%= username %></h4>
					
		
		        	
						      <p class="text-sm mb-0 text-capitalize">NAME</p>
						      <h4 class="mb-0"><%= name %></h4>
					
				
					    	
						      <p class="text-sm mb-0 text-capitalize">EMAIL</p>
						      <h4 class="mb-0"><%= email %></h4>
						   
			
			       
						      <p class="text-sm mb-0 text-capitalize">CONTACT NO</p>
						      <h4 class="mb-0"><%= contactNumber %></h4>
					
					
							
						      <p class="text-sm mb-0 text-capitalize">COUNTRY</p>
						      <h4 class="mb-0"><%= country %></h4>
					
				

    

<%
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        // Handle the case where the access token is not present
        out.println("Access token is missing.");
    }
%>