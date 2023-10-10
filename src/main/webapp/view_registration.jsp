<%@page import="com.services.database.*"%>
<%@page import="java.sql.*"%>
<%@include file="structure.jsp"%>

<% String username = (String) request.getSession().getAttribute("username"); %>
        			<h4>All Reservations</h4>
        	
        		
        			<%
						try {
							Connection connection =DatabaseConnection.getConnection();
							PreparedStatement ps = connection.prepareStatement("select * from vehicle_service where username='birunth-se19006@stu.kln.ac.lk'");
							ResultSet rs = ps.executeQuery();

							if (rs.next()) {
					%>
        			<table >
        				<thead>
        					<tr>
        						<th>Booking ID</th>
        						<th>Date</th>
        						<th>Time</th>
        						<th>Location</th>
        						<th>Vehicle Number</th>
        						<th>Mileage</th>
        						<th>Message</th>
        						
        						<th></th>
        					</tr>
        				</thead>      						
        				<tbody>
        					<%
								do {
							%>
        					<tr>
        						<td><%=rs.getString(1) %></td>
        						<td><%=rs.getString(2) %></td>
        						<td><%=rs.getString(3) %></td>
        						<td><%=rs.getString(4) %></td>
        						<td><%=rs.getString(5) %></td>
        						<td><%=rs.getString(6) %></td>
        						<td><%=rs.getString(7) %></td>
        						
        					</tr>
        					<%
								} while (rs.next());
							%>
        				</tbody>
        			</table>
        			<%
						} else {
					%>
					<p>No reservations found.</p>
					<%
						}
					} catch (Exception e) {
						System.out.println(e);
					}
					%>
 